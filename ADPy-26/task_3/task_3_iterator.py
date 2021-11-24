from lst import *


class FlatIterator:
    def __init__(self, nested_lst):
        self.nested_lst = nested_lst

    def __iter__(self):
        return self

    def __next__(self):
        for items in self.nested_lst:
            if isinstance(items, list):
                for item in FlatIterator(items):
                    if isinstance(item, list):
                        self.nested_lst.remove(item)
                    return item
            if isinstance(items, list):
                continue
            self.nested_lst.remove(items)
            return items
        raise StopIteration


if __name__ == '__main__':
    for item in FlatIterator(nested_list_v1):
        print(item)
