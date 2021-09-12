if __name__ == '__main__':

    # ['2018-01-01', 'yandex', 'cpc', 100] (он может быть любой длины) в словарь {'2018-01-01': {'yandex': {'cpc': 100}}}

    lst = ['2018-01-01', 'yandex', 'cpc', 100]

    d = {lst[-2]: lst[-1]}

    for i in lst[-3::-1]:
        d = dict.fromkeys([i], d)
    print(d)
