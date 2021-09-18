import requests
from pprint import pprint
from datetime import datetime, timedelta

two_days_ago = (datetime.now() - timedelta(days=2)).strftime('%s')

tag = 'python'

json_response = requests.get(
    'https://api.stackexchange.com/2.3/questions?fromdate=' + two_days_ago +
    '&order=desc&sort=activity&tagged=' + tag + '&site=stackoverflow'
).json()

dct = dict()

for i in json_response['items']:
    dct[i['title']] = i['tags']
pprint(dct)
