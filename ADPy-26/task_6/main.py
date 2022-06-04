'''
Необходимо парсить страницу со свежими статьями (вот эту) и выбирать те статьи,
в которых встречается хотя бы одно из ключевых слов (эти слова определяем в начале скрипта).
Поиск вести по всей доступной preview-информации (это информация, доступная непосредственно с текущей страницы).
Вывести в консоль список подходящих статей в формате: <дата> - <заголовок> - <ссылка>.

Улучшить скрипт так, чтобы он анализировал не только preview-информацию статьи, но и весь текст статьи целиком.
Для этого потребуется получать страницы статей и искать по тексту внутри этой страницы.
'''

import requests
import re
from bs4 import BeautifulSoup


url = 'https://habr.com/ru/all/'
headers = {'User-Agent': 'Mozilla/5.0'}

response = requests.get(url, headers=headers)
response.raise_for_status()

KEYWORDS = ['дизайн', 'фото', 'web', 'python']

regex = re.compile('[^a-zA-Zа-яА-Яё0-9\-\s]')

soup = BeautifulSoup(response.text, features='html.parser')
articles = soup.find_all('article')

# open('habr.html', 'w').write(soup.prettify())
# print(soup.prettify())

for article in articles:

    date = article.find_all(class_="tm-article-snippet__datetime-published")
    date = list([d.find('time')['title'] for d in date])

    headers = article.find_all(class_="tm-article-snippet__title tm-article-snippet__title_h2")
    link = list([header.find('a')['href'] for header in headers])
    headers = list([header.find('span').text.lower() for header in headers])

    flag = False

    for head in headers:
        head = regex.sub('', head)
        if set(KEYWORDS) & set(head.split(' ')):
            print(f'{date[0]} - {headers[0]} - {link[0]}')
            flag = True

    if flag:
        continue

    if article.find_all('div', class_="article-formatted-body " + "article-formatted-body_version-1") or \
            article.find_all(class_="article-formatted-body " + "article-formatted-body_version-2") is not None:
        body = article.text.lower()
        body = regex.sub('', body)
        if set(KEYWORDS) & set(body.split(' ')):
            print(f'{date[0]} - {headers[0]} - {link[0]}')
