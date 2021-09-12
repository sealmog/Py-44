if __name__ == '__main__':

    ids = {'user1': [213, 213, 213, 15, 213],
           'user2': [54, 54, 119, 119, 119],
           'user3': [213, 98, 98, 35]}

    ids_uniq = set()

    for key, value in ids.items():
        for i in value:
            ids_uniq.add(i)
    print([*ids_uniq])