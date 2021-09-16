import requests

heroes = ['Hulk', 'Captain America', 'Thanos']

def get_hero_intelligence(heroes: list) -> dict:
    re: int = 0

    for hero in heroes:
        json_response = requests.get(
            'https://superheroapi.com/api/2619421814940190/search/' + hero
        ).json()

        intelligence = int(json_response['results'][0]['powerstats']['intelligence'])

        if intelligence > re:
            res = {hero: intelligence}

    return res

print(get_hero_intelligence(heroes))
