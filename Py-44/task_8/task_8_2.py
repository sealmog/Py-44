import argparse
import os
import requests


class YaUploader:
    def __init__(self, token: str):
        self.token = token
        self.url = 'https://cloud-api.yandex.net/v1/disk/resources'
        self.headers = {'Content-Type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': f'OAuth {self.token}'}


    def upload(self, file_path: str, replace=False):
        if os.path.isfile(file_path):
            file = file_path.split('/')[-1]
            with open(file_path, 'rb') as f:
                r = requests.get(f'{self.url}/upload?path={file}&overwrite={replace}',
                                 headers=self.headers).json()
                if 'error' in r.keys():
                    return f'{r["error"]}'

                res = requests.put(r['href'], files={'file': f})
        else:
            return f'File not found'
        return res.status_code


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-t', '--token', required=True, help='Token for Yandex Disk')
    parser.add_argument('-f', '--file', required=True, help='File to upload')
    args = parser.parse_args()
    uploader = YaUploader(args.token)
    print(uploader.upload(args.file))
