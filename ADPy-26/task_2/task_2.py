"""
    поместить Фамилию, Имя и Отчество человека в поля lastname, firstname и surname соответственно.
    В записной книжке изначально может быть Ф + ИО, ФИО, а может быть сразу правильно: Ф+И+О;
    привести все телефоны в формат +7(999)999-99-99. Если есть добавочный номер, формат будет такой: +7(999)999-99-99 доб.9999;
    объединить все дублирующиеся записи о человеке в одну.

    ['lastname', 'firstname', 'surname', 'organization', 'position', 'phone', 'email']

"""

from pprint import pprint
import csv
import re

pattern_number = re.compile(r"(\+7|8)[\s\-(]*(\d{3}|\s*\d{3})[\)\s-]*(\d{3})[\s\-]*(\d{2})[\s\-]*(\d{2})")
pattern_additional = re.compile(r"\(*(\w+\.)\s(\d+)\)*")


with open("phonebook_raw.csv") as f:
    rows = csv.reader(f, delimiter=",")
    contacts_list = list(rows)

lst = []
result = [{}]

for i in contacts_list:
    if i[0] == 'lastname':
        header = i
    else:
        lst = i[0].split(' ')
        if i[1].split(' ')[0]:
            lst += i[1].split(' ')
        if i[2].split(' ')[0]:
            lst += i[2].split(' ')
        if len(lst) <= 2:
            lst.append('')

        phone = pattern_number.sub(r"+7(\2)\3-\4-\5", i[5])
        phone = pattern_additional.sub(r"\1\2", phone)

        for d in result:
            if lst[0] in d.values() and lst[1] in d.values():
                new = False
                d[header[2]] = lst[2] if not d[header[2]] else d[header[2]]
                d[header[3]] = i[3] if not d[header[3]] else d[header[3]]
                d[header[4]] = i[4] if not d[header[4]] else d[header[4]]
                d[header[5]] = phone if not d[header[5]] else d[header[5]]
                d[header[6]] = i[6] if not d[header[6]] else d[header[6]]
                break
            else:
                new = True

        if new:
            result += [{
                header[0]: lst[0],
                header[1]: lst[1],
                header[2]: lst[2],
                header[3]: i[3],
                header[4]: i[4],
                header[5]: phone,
                header[6]: i[6]
            }]

result.remove({})

csv_file = 'phonebook.csv'
with open(csv_file, 'w', encoding='utf-8') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=header, )
    writer.writeheader()
    for data in result:
        writer.writerow(data)
