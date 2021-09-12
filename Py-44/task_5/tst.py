# class Person:
#     def __init__(self, id):
#         self.id = id
#
#     def one(self, plus):
#         return plus + plus
#
#     def one(self, mi, mu):
#         return mi + mu
#
# some_person = Person(100)
# print(some_person.one(10))
# print(some_person.one(20, 30))
#
# # some_person.__dict__['age'] = 30
# # print(some_person.age + len(some_person.__dict__))

class Income:
    def __init__(self, id_):
        self.id_ = id_
        id_ = 100
income_1 = Income(1000)
print(income_1.id_)
