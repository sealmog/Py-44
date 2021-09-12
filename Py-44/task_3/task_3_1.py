if __name__ == '__main__':

    boys = ['Peter', 'Alex', 'John', 'Arthur', 'Richard']
    girls = ['Kate', 'Liza', 'Kira', 'Emma', 'Trisha']

    if len(boys) == len(girls):
        print('Идеальные пары:')
        for boy, girl in zip(boys, girls):
            print(f'{boy} и {girl}')
    else:
        print('Количество людей в списках не совпадает')
