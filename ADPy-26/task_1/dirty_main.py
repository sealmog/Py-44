from datetime import date
from application.salary import *
from db.people import *


def main():
    now = date.today()
    print(f'Текущая дата: {now}')
    calculate_salary(now)
    get_employees(now)


if __name__ == '__main__':
    main()
