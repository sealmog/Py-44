'''
Написать декоратор - логгер. Он записывает в файл дату и время вызова функции, имя функции, аргументы, с которыми вызвалась и возвращаемое значение.
Написать декоратор из п.1, но с параметром – путь к логам.
'''

from lst import *
from logs import logger_wraps


@logger_wraps(logpath='logs2')
def flat_generator(lst):
    for items in lst:
        if isinstance(items, list):
            yield from flat_generator(items)
        else:
            yield items


if __name__ == '__main__':
    for item in flat_generator(nested_list_v1):
        # print(item)
        pass
