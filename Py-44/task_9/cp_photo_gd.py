from google.oauth2 import service_account
from googleapiclient.http import MediaIoBaseDownload, MediaIoBaseUpload
from googleapiclient.discovery import build
import io
import json
import logging


class GoogleDrive:
    def __init__(self, sa_file: str):
        self.sa_file = sa_file
        self.scope = ['https://www.googleapis.com/auth/drive']

    def get_id(self) -> dict:
        credentials = service_account.Credentials.from_service_account_file(
            self.sa_file, scopes=self.scope)

        service = build('drive', 'v3', credentials=credentials)

        result = service.files().list(
            pageSize=1000,
            fields="nextPageToken, "
                   "files(id, name, mimeType, trashed, md5Checksum)"
        ).execute()

        return result

    def get_folder(self, folder: str) -> dict:
        credentials = service_account.Credentials.from_service_account_file(
            self.sa_file, scopes=self.scope)

        service = build('drive', 'v3', credentials=credentials)

        # with open('gd.json', 'w') as f:
        #     json.dump(self.get_id(), f)

        for i in self.get_id()['files']:
            if i['name'] == '_upload' and not i['trashed']:
                folder_id = i['id']
                logging.info(f"Get root folder ID: {folder_id}")

            # if i['name'] == folder and not i['trashed']:
                # print({'id': i['id']})
                # return {'id': i['id']}

        file_metadata = {
            'name': folder,
            'mimeType': 'application/vnd.google-apps.folder',
            'parents': [folder_id]
        }
        r = service.files().create(body=file_metadata,
                                   fields='id').execute()
        logging.info(f"Create folder: {r}")
        return r

    def create_photos(self, photos_lst: list, folder: dict) -> list:
        result = list()
        credentials = service_account.Credentials.from_service_account_file(
            self.sa_file, scopes=self.scope)

        service = build('drive', 'v3', credentials=credentials)

        for i in photos_lst:

            fh = io.BytesIO(i['raw'].read())
            filename = str(i["date"]) + '.jpg'

            file_metadata = {
                            'name': filename,
                            'parents': [folder['id']]
                        }
            media = MediaIoBaseUpload(fh, mimetype='image/jpeg',
                                      chunksize=1024*1024, resumable=True)
            r = service.files().create(body=file_metadata,
                                       media_body=media, fields='id').execute()
            logging.info(f"Create photo: {r}")

            result += [{
                'file_name': filename,
                'size': i['size'],
                'result': r
            }]

        return result
