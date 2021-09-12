if __name__ == '__main__':

    salary = input('Введите желаемую заработную плату в месяц: ')
    balance_mortgage = input('Введите, какой процент(%) уходит на ипотеку: ')
    balance_life = input('Введите, какой процент(%) уходит на жизнь: ')

    if salary.isdigit() > 0 \
            and balance_mortgage.isdigit() > 0 and balance_life.isdigit() > 0:
        salary_int = int(salary)
        balance_mortgage_int = int(balance_mortgage)
        balance_life_int = int(balance_life)
        if (balance_mortgage_int + balance_life_int) <= 100:
            print('На ипотеку было потрачено: ',
                  salary_int * 12 * balance_mortgage_int / 100, 'рублей')
            print('Было накоплено: ',
                  salary_int * 12 * (1 - (balance_mortgage_int + balance_life_int) / 100), 'рублей')
        else:
            print('Сумма процентов не может превышать 100')
    else:
        print('Заработная плата или процент только натуральные числа')
