if __name__ == '__main__':

    month = input('Введите месяц: ')
    day = int(input('Введите число: '))

    if month == 'апрель' and 19 <= day <= 30 or \
            month == 'май' and 1 <= day <= 13:
        print('Овен')
    elif month == 'май' and 14 <= day <= 31 or \
            month == 'июнь' and 1 <= day <= 19:
        print('Телец')
    elif month == 'июнь' and 20 <= day <= 30 or \
            month == 'июль' and 1 <= day <= 20:
        print('Близнецы')
    elif month == 'июль' and 21 <= day <= 31 or \
            month == 'август' and 1 <= day <= 9:
        print('Рак')
    elif month == 'август' and 10 <= day <= 31 or \
            month == 'сентябрь' and 1 <= day <= 15:
        print('Лев')
    elif month == 'сентябрь' and 16 <= day <= 30 or \
            month == 'октябрь' and 1 <= day <= 30:
        print('Дева')
    elif month == 'октябрь' and 31 <= day <= 31 or \
            month == 'ноябрь' and 1 <= day <= 22:
        print('Весы')
    elif month == 'ноябрь' and 23 <= day <= 29:
        print('Скорпион')
    elif month == 'ноябрь' and 30 <= day <= 30 or \
            month == 'декабрь' and 1 <= day <= 17:
        print('Змееносец')
    elif month == 'декабрь' and 18 <= day <= 31 or \
            month == 'январь' and 1 <= day <= 18:
        print('Стрелец')
    elif month == 'январь' and 19 <= day <= 31 or \
            month == 'февраль' and 1 <= day <= 15:
        print('Козерог')
    elif month == 'февраль' and 16 <= day <= 29 or \
            month == 'март' and 1 <= day <= 11:
        print('Водолей')
    elif month == 'март' and 12 <= day <= 31 or \
            month == 'апрель' and 1 <= day <= 18:
        print('Рыбы')
    else:
        print('Не корректная дата')
