"""
Из курса «Python: программирование на каждый день и сверхбыстрое прототипирование» необходимо протестировать программу по работе с бухгалтерией Лекции 2.1.
При наличии своего решения данной задачи можно использовать его или использовать предложенный код в директории scr текущего задания.
Следует протестировать основные функции по получению информации о документах, добавлении и удалении элементов из словаря.

Рекомендации по тестам.
Если у вас в функциях информация выводилась(print), то теперь её лучше возвращать(return) чтобы можно было протестировать.
input можно "замокать" с помощью unittest.mock.patch, если с этим будут проблемы, то лучше переписать функции так, чтобы данные приходили через параметры.


Проверим правильность работы Яндекс.Диск REST API. Написать тесты, проверяющий создание папки на Диске.
Используя библиотеку requests напишите unit-test на верный ответ и возможные отрицательные тесты на ответы с ошибкой

Пример положительных тестов:
Код ответа соответствует 200.
Результат создания папки - папка появилась в списке файлов.


Применив selenium, напишите unit-test для авторизации на Яндексе по url: https://passport.yandex.ru/auth/
"""


import pytest
from task_5 import find_people_by_document, find_shelf_by_document, print_documents, \
                    add_to_documents, add_to_self, delete_document_from_document, \
                    delete_document_from_shelf, add_shelf, documents, directories

# TEST_CASES = [
#         ('passport', '123-123', 'Василий Гупкин', documents['passport'])
#     ]


class TestTask:

    @classmethod
    def setup_class(cls):
        print('setup_class')

    # @pytest.mark.parametrize('a,b,expected_result', TEST_CASES)
    def test_add_to_documents(self):
        assert add_to_documents('passport', '123-123', 'Василий Гупкин') == documents['passport']

    # def test_multiplication_string(self):
    #     assert multiplication_string('a', 3) == 'aaa'
