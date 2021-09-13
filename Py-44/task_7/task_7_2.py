import os

def main():
    f_dct: dict = dict()

    with open('file.out', 'w') as f:
        f.write('')

    for subdir, dirs, files in os.walk(r'sorted'):
        for filename in files:
            file = subdir + os.sep + filename

            with open(file, 'r') as f:
                data = f.read()
                counter = data.count('\n')
                f_dct[file] = counter

        for i in sorted(f_dct.items(), key=lambda kv: (kv[1], kv[0])):
            with open('file.out', 'a') as f:
                f.write(f'{i[0]}\n')
                f.write(f'{i[1]}\n')
                with open(i[0], 'r') as fi:
                    n = 0
                    for line in fi:
                        n += 1
                        fil = i[0].rsplit('/')
                        num = fil[1].split('.')
                        lin = line.split('\n')
                        f.write(f'Строка номер {n} файла номер {num[0]}: {lin[0]}\n')


if __name__ == "__main__":
    main()