from datetime import date
from application.salary import calculate_salary
from db.people import get_employees


def main():
    now = date.today()
    print(f'Текущая дата: {now}')
    calculate_salary(now)
    get_employees(now)


if __name__ == '__main__':
    main()
