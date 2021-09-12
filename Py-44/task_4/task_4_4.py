if __name__ == '__main__':

    stats = {'facebook': 55, 'yandex': 120, 'vk': 115, 'google': 99, 'email': 42, 'ok': 98}

    max_value = 0
    max_vendor = ''

    for vendor, value in stats.items():
        if value > max_value:
            max_value = value
            max_vendor = vendor
    print(max_vendor)
