if __name__ == '__main__':

    height = 190
    age = 28
    children = 1
    training = False

    if training or children > 1:
        print('Отсрочка')
    elif 18 > age or age >= 28:
        print('Не призывной возраст')
    elif height < 170 and 18 <= age < 27:
        print('В танкисты')
    elif height < 185 and 18 <= age < 27:
        print('На флот')
    elif height < 200 and 18 <= age < 27:
        print('В десантники')
    else:
        print('В другие войска')