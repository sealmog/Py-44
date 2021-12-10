"""
Из курса «Python: программирование на каждый день и сверхбыстрое прототипирование»
необходимо протестировать программу по работе с бухгалтерией Лекции 2.1.
При наличии своего решения данной задачи можно использовать его или использовать предложенный код
в директории scr текущего задания.
Следует протестировать основные функции по получению информации о документах,
добавлении и удалении элементов из словаря.

Рекомендации по тестам.
Если у вас в функциях информация выводилась(print), то теперь её лучше возвращать(return)
чтобы можно было протестировать.
input можно "замокать" с помощью unittest.mock.patch, если с этим будут проблемы,
то лучше переписать функции так, чтобы данные приходили через параметры.

Проверим правильность работы Яндекс. Диск REST API. Написать тесты, проверяющий создание папки на Диске.
Используя библиотеку requests напишите unit-test на верный ответ и возможные отрицательные тесты на ответы с ошибкой

Пример положительных тестов:
Код ответа соответствует 200.
Результат создания папки - папка появилась в списке файлов.

Применив selenium, напишите unit-test для авторизации на Яндексе по url: https://passport.yandex.ru/auth/
"""

from yadisk import YaDisk
from task_5 import find_people_by_document, find_shelf_by_document, print_documents, \
                    add_to_documents, add_to_self, delete_document_from_document, \
                    delete_document_from_shelf, add_shelf, documents, directories

documents_test = [
    {"type": "passport", "number": "2207 876234", "name": "Василий Гупкин"},
    {"type": "invoice", "number": "11-2", "name": "Геннадий Покемонов"},
    {"type": "insurance", "number": "10006", "name": "Аристарх Павлов"},
    {"type": "pass", "number": "234-5", "name": "Вася Пупкин"}
]

directories_test = {
    '1': ['2207 876234'],
    '2': ['10006'],
    '3': []
}

folder = '_2021'

with open('yadisk.token', 'r') as f:
    token = f.read()


class TestTask:

    def test_add_to_documents(self):
        add_to_documents('pass', '234-5', 'Вася Пупкин')
        assert documents == documents_test

    def test_delete_document_from_shelf(self):
        delete_document_from_shelf('11-2')
        assert directories == directories_test

    def test_find_shelf_by_document(self):
        assert find_shelf_by_document('2207 876234') == '1'


class TestYaDisk:

    @classmethod
    def setup_class(cls):
        yadisk = YaDisk(token)
        yadisk.delete_folder(folder)

    def test_create_folder_created(self):
        yadisk = YaDisk(token)
        assert yadisk.create_folder(folder) == 201

    def test_create_folder_exist(self):
        yadisk = YaDisk(token)
        assert yadisk.create_folder(folder) == 200

    def test_create_folder_unauthorized(self):
        yadisk = YaDisk('token')
        assert yadisk.create_folder(folder) == 401
