import argparse
import requests
from pprint import pprint
from datetime import date
import logging
import json
from cp_photo_gd import GoogleDrive


class VKPhotos:
    url = 'https://api.vk.com/method/'

    def __init__(self, token: str, number: int, version='5.131'):
        self.number = number
        self.params = {
            'access_token': token,
            'v': version
        }

    @property
    def get_photos(self) -> list:
        photos_lst = list()
        num = 0
        photos_url = self.url + 'photos.get'
        photos_params = {
            'album_id': 'profile',
            'count': 100,
            'extended': 1
        }

        r = requests.get(photos_url,
                         params={**self.params, **photos_params})
        if r.status_code == 200:
            logging.info(f'Get photos URL, status: {r.status_code}')
        else:
            logging.error(f'Get photos URL: {r.url}, status: {r.status_code}')
            return None

        r_json = r.json()

        for i in r_json['response']['items']:
            if self.number > num:
                num += 1
            else:
                break

            r = requests.get(i['sizes'][-1]['url'], stream=True)
            if r.status_code == 200:
                logging.info(f'Get photos URL: {r.url}, '
                             f'status: {r.status_code}')

                photos_lst += [{
                    'date': i['date'],
                    'likes': i['likes']['count'],
                    'size': i['sizes'][-1]['type'],
                    'url': i['sizes'][-1]['url'],
                    'raw': r.raw
                }]

        return photos_lst


class YaDisk:
    def __init__(self, token: str):
        self.token = token
        self.url = 'https://cloud-api.yandex.net/v1/disk/resources'
        self.headers = {'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': f'OAuth {self.token}'}

    def create_folder(self, folder: str) -> int:
        rf = requests.get(f'{self.url}?path={folder}', headers=self.headers)

        if rf.status_code == 200:
            logging.info(f'Folder {folder} exist: {rf.url}, '
                         f'status: {rf.status_code}')
            return rf.status_code
        else:
            rf = requests.put(f'{rf.url}', headers=self.headers)
            rf_json = rf.json()
            if 'error' in rf_json.keys():
                logging.error(f"Create folder {folder}: {rf.url}, "
                              f"status: {rf.status_code} {rf_json['error']}")
                return rf.status_code
            else:
                logging.info(f'Create folder {folder}: {rf.url}, '
                             f'status: {rf.status_code}')
                return rf.status_code

    def put_photos(self, photos_lst: list, folder: str, replace=False) -> list:
        resp_lst = list()

        if self.create_folder(folder) >= 400:
            return None

        for i in photos_lst:

            filename = str(i["date"]) + '.jpg'
            r = requests.get(f'{self.url}/upload?path={folder}'
                             f'/{filename}&overwrite={replace}',
                             headers=self.headers)
            r_json = r.json()

            if 'error' in r_json.keys():
                logging.warning(f"Get photo {filename}: {r.url}, "
                                f"status: {r.status_code} {r_json['error']}")

                resp_lst += [{
                    'file_name': filename,
                    'size': i['size'],
                    'result': r_json['error']
                }]
                continue

            res = requests.put(r_json['href'], files={'file': i['raw']})
            logging.info(f"Upload photo: {res.url}, status: {res.status_code}")

            resp_lst += [{
                'file_name': filename,
                'size': i['size'],
                'status_code': res.status_code
            }]

        return resp_lst


if __name__ == '__main__':
    logger = logging.getLogger('logger')
    logging.basicConfig(level=logging.INFO,
                        filename='app.log', filemode='w',
                        format='%(name)s - %(levelname)s - %(message)s')

    today = date.today()
    folder = today.strftime('%Y%m%d')

    parser = argparse.ArgumentParser()
    parser.add_argument('-c', '--cloud', required=True,
                        help='Cloud Storage: Yandex or Google')
    parser.add_argument('-n', '--number',
                        help='Number of files for upload', default=5)
    parser.add_argument('-vk', '--vk_token', required=True,
                        help='VK token')
    parser.add_argument('-r', '--replace',
                        action=argparse.BooleanOptionalAction,
                        help='Use replace to override photos')
    parser.add_argument('-yd', '--yd_token',
                        help='Yandex Disk token')
    parser.add_argument('-gd', '--gd_file',
                        help='Google Drive Service Account file')
    args = parser.parse_args()

    if args.cloud == 'Yandex':
        if args.yd_token:

            vk_client = VKPhotos(token=args.vk_token, number=int(args.number))
            yd_client = YaDisk(token=args.yd_token)

            if args.replace:
                result = yd_client.put_photos(vk_client.get_photos,
                                              folder, replace=True)
            else:
                result = yd_client.put_photos(vk_client.get_photos, folder)

            with open('app.json', 'w') as f:
                json.dump(result, f)
            # pprint(result)

    elif args.cloud == 'Google':
        if args.gd_file:
            vk_client = VKPhotos(token=args.vk_token, number=int(args.number))
            gd_client = GoogleDrive(sa_file=args.gd_file)
            folder_id = gd_client.get_folder(folder)
            result = gd_client.create_photos(vk_client.get_photos, folder_id)

            with open('app.json', 'w') as f:
                json.dump(result, f)
            # pprint(result)

    else:
        print('Use "Yandex" or "Google" for upload photos')
