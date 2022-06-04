import requests


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
            return rf.status_code
        else:
            rf = requests.put(f'{rf.url}', headers=self.headers)
            rf_json = rf.json()
            if 'error' in rf_json.keys():
                return rf.status_code
            else:
                return rf.status_code

    def delete_folder(self, folder: str) -> int:
        rf = requests.delete(f'{self.url}?path={folder}', headers=self.headers)

        if rf.status_code == 200:
            return rf.status_code
        else:
            return rf.status_code
