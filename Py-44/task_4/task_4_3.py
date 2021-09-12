if __name__ == '__main__':

    queries = [
        'смотреть сериалы онлайн',
        'новости спорта',
        'афиша кино',
        'курс доллара',
        'сериалы этим летом',
        'курс по питону',
        'сериалы про спорт'
    ]

    count = 0
    dct = {}

    for i in queries:
        words = 0
        for w in i.split():
            words += 1
        dct[words] = dct.get(words, 0) + 1
        count += 1

    for key, val in dct.items():
        print(f'Запросов из {key} слов: {val / count * 100:.1f}%')
