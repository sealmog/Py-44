class Student:
    def __init__(self, name, surname, gender):
        self.name = name
        self.surname = surname
        self.gender = gender
        self.finished_courses = []
        self.courses_in_progress = []
        self.grades = {}
        self.avg_grade = None

    def add_courses(self, course_name):
        self.finished_courses.append(course_name)

    def rate_lecture(self, lecturer, course, grade):
        if isinstance(lecturer, Lecturer) and course in self.courses_in_progress and course in lecturer.courses_attached:
            if course in lecturer.grades:
                lecturer.grades[course] += [grade]
                lecturer.avg_grade = avg_grade(lecturer.grades.values())
            else:
                lecturer.grades[course] = [grade]
                lecturer.avg_grade = avg_grade(lecturer.grades.values())
        else:
            return 'Ошибка'

    def __str__(self):
        res = f'Имя: {self.name} \nФамилия: {self.surname}\n' \
              f'Средняя оценка за домашние задания: {self.avg_grade}\n' \
              f'Курсы в процессе изучения: {self.courses_in_progress}\n' \
              f'Завершенные курсы: {self.finished_courses}\n'
        return res

    def __lt__(self, other):
        if not isinstance(other, Student):
            print('Not a Student!')
            return
        return self.avg_grade < other.avg_grade


class Mentor:
    def __init__(self, name, surname):
        self.name = name
        self.surname = surname
        self.courses_attached = []


class Lecturer(Mentor):
    def __init__(self, name, surname):
        super().__init__(name, surname)
        self.grades = {}
        self.avg_grade = None

    def __str__(self):
        res = f'Имя: {self.name} \nФамилия: {self.surname}\n' \
              f'Средняя оценка за лекции: {self.avg_grade}\n'
        return res

    def __lt__(self, other):
        if not isinstance(other, Lecturer):
            print('Not a Lecturer!')
            return
        return self.avg_grade < other.avg_grade


class Reviewer(Mentor):
    def rate_home_work(self, student, course, grade):
        if isinstance(student, Student) and course in self.courses_attached and course in student.courses_in_progress:
            if course in student.grades:
                student.grades[course] += [grade]
                student.avg_grade = avg_grade(student.grades.values())
            else:
                student.grades[course] = [grade]
                student.avg_grade = avg_grade(student.grades.values())
        else:
            return 'Ошибка'

    def __str__(self):
           res = f'Имя: {self.name} \nФамилия: {self.surname}\n'
           return res


def avg_grade(lst):
    flatten_lst = [y for x in lst for y in x]
    if len(flatten_lst):
        return f'{sum(flatten_lst) / len(flatten_lst):.2f}'


def avg_grade_per_homeworks(students, course):
    sum_grades = 0
    count = 0
    for student in students:
        if isinstance(student, Student) and course in student.grades:
            for grade in student.grades[course]:
                sum_grades += grade
                count += 1
    return f'Средняя оценка за домашние задания для курса {course}: {sum_grades / count:.2f}'


def avf_grade_per_lectures(lecturers, course):
    sum_grades = 0
    count = 0
    for lecturer in lecturers:
        if isinstance(lecturer, Lecturer) and course in lecturer.grades:
            for grade in lecturer.grades[course]:
                sum_grades += grade
                count += 1
    return f'Средняя оценка за лекции для курса {course}: {sum_grades / count:.2f}'


best_student = Student('Ruoy', 'Eman', 'your_gender')
best_student.courses_in_progress += ['Python']
best_student.courses_in_progress += ['Java']
best_student.courses_in_progress += ['C']
best_student.finished_courses += ['Go']
best_student.add_courses('C')

other_student = Student('Mija', 'Maxx', 'female')
other_student.courses_in_progress += ['Python', 'Go', 'C']
other_student.finished_courses += ['C', 'Go']
other_student.add_courses('JS')

cool_reviewer = Reviewer('Some', 'Buddy')
cool_reviewer.courses_attached += ['Python']
cool_reviewer.courses_attached += ['Java']

other_reviewer = Reviewer('Agent', 'Smith')
other_reviewer.courses_attached += ['Go', 'C']

cool_lecturer = Lecturer('Iv', 'Loran')
cool_lecturer.courses_attached += ['Python', 'Java', 'C']

other_lecturer = Lecturer('Rick', 'Deckard')
other_lecturer.courses_attached += ['C', 'Go']

cool_reviewer.rate_home_work(best_student, 'Python', 10)
cool_reviewer.rate_home_work(best_student, 'Python', 9)
cool_reviewer.rate_home_work(best_student, 'Python', 10)
cool_reviewer.rate_home_work(best_student, 'Java', 8)

other_reviewer.rate_home_work(best_student, 'C', 10)
other_reviewer.rate_home_work(other_student, 'C', 9)
other_reviewer.rate_home_work(other_student, 'Go', 10)

best_student.rate_lecture(cool_lecturer, 'Python', 10)
best_student.rate_lecture(cool_lecturer, 'Java', 10)
best_student.rate_lecture(cool_lecturer, 'C', 9)

other_student.rate_lecture(cool_lecturer, 'Python', 10)
other_student.rate_lecture(other_lecturer, 'Go', 10)
other_student.rate_lecture(other_lecturer, 'C', 9)


print(best_student)
print(other_student)

print(cool_reviewer)
print(other_reviewer)

print(cool_lecturer)
print(other_lecturer)

# print(best_student < other_student)
# print(cool_lecturer == other_lecturer)

print(avg_grade_per_homeworks([best_student, other_student, other_reviewer], 'Python'))
print(avg_grade_per_homeworks([best_student, other_student], 'C'))

print(avf_grade_per_lectures([cool_lecturer, other_lecturer], 'Python'))
print(avf_grade_per_lectures([cool_lecturer, other_lecturer], 'C'))