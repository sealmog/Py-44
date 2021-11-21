from lst import *


def flat_generator(lst):
    for items in lst:
        if isinstance(items, list):
            yield from flat_generator(items)
        else:
            yield items


if __name__ == '__main__':
    for item in flat_generator(nested_list_v1):
        print(item)
