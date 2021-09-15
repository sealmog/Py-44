from pprint import pprint


def prepare_dict(file_name: str) -> dict:
    result: dict = dict()

    with open(file_name) as file:
        for line in file:
            dish = line.strip()
            record_quantity = int(file.readline())
            ingredient_list = []
            for ingredient in range(record_quantity):
                ingredient_name, quantity, measure = file.readline().split('|')
                ingredient_list.append(
                    dict(ingredient_name=ingredient_name, quantity=int(quantity),
                         measure=measure.replace('\n', '').replace(' ', ''))
                )
            result[dish] = ingredient_list
            file.readline()
    return result


def get_shop_list_by_dishes(dishes: list, person_count: int, result_dict: dict) -> dict:
    result: dict = dict()

    for dish in dishes:
        if dish in result_dict:
            for ingredient in result_dict[dish]:
                if ingredient['ingredient_name'] not in result:
                    result[ingredient['ingredient_name']] = \
                        {'measure': ingredient['measure'], 'quantity': ingredient['quantity']}
                else:
                    result[ingredient['ingredient_name']]['quantity'] = \
                        result[ingredient['ingredient_name']]['quantity'] + ingredient['quantity']
    pprint(result)


def main():

    result_dict = prepare_dict('recipes.txt')
    # pprint(result_dict)

    get_shop_list_by_dishes(['Запеченный картофель', 'Омлет', 'Яичница'], 2, result_dict)


if __name__ == "__main__":
    main()
