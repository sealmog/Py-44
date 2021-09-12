if __name__ == '__main__':

    square_side_length = input('Введите длину стороны квадрата: ')

    if square_side_length.isnumeric() > 0:
        square_side_length_int = int(square_side_length)
        print('Периметр квадрата: ', (square_side_length_int * 4))
        print('Площадь квадрата: ', (square_side_length_int ** 2))
    else:
        print('Для ввода длины используйте только натуральные числа')

    rectangle_side_length = input('Введите длину прямоугольника: ')
    rectangle_side_width = input('Введите ширину прямоугольника: ')

    if rectangle_side_length.isdigit() > 0 and rectangle_side_width.isdigit() > 0:
        rectangle_side_length_int = int(rectangle_side_length)
        rectangle_side_width_int = int(rectangle_side_width)
        print('Периметр прямоугольника: ',
              (rectangle_side_length_int * 2 + rectangle_side_width_int * 2))
        print('Площадь прямоугольника: ',
              (rectangle_side_length_int * rectangle_side_width_int))
    else:
        print('Для ввода длины используйте только натуральные числа')
