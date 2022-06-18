/*
Задание 1
В отдельном файле с расширением .js напишите программу, включающую в себя:
    Определения классов:
    Good - класс для хранения данных о товаре со свойствами:
        id            Код товара
        name          Наименование
        description   Описание
        sizes         массив возможных размеров
        price         цена товара
        available     Признак доступности для продажи
Реализауйте в Good следующие методы:
        constructor()   конструктор экземпляра товара принимающий параметры соответствующие свойствам выше
        setAvailable()  изменение признака доступности для продажи
Далее предполагается, что в каждом классе необходимо также реализовать конструктор.
    GoodsList - класс для хранения каталога товаров со свойствами:
        #goods       массив экземпляров объектов класса Good (приватное поле)
        filter       регулярное выражение используемое для фильтрации товаров по полю name
        sortPrice    булево значение, признак включения сортировки по полю Price
        sortDir      булево значение, признак направления сортировки по полю Price (true - по возрастанию, false - по убыванию)
Реализуйте в GoodsList геттер и методы:
        get list()     возвращает массив доступных для продажи товаров в соответствии с установленным фильтром и сортировкой по полю Price
        add()          добавление товара в каталог
        remove(id)     удаление товара из каталога по его id
Для фильтрации и сортировки используйте функции массивов filter и sort с передачей в них соответствующих стрелочных функций.
Для проверки соответствия поля name регулярному выражению в фильтре, используйте такую конструкцию filter.test(good.name).
При этом в поле filter должно быть записано регулярное выражение, описываемое в JS как:
        /<regexp>/<flags>
подробнее с регулярными выражениями в JavaScript можно познакомиться здесь: https://learn.javascript.ru/regular-expressions
    BasketGood - класс дочерний от Good, для хранения данных о товаре в корзине с дополнительным свойством:
        amount      количество товара в корзине
В конструктор данного класса в качестве параметра должен передаваться экземпляр класса Good (товар помещаемый в корзину),
значения свойств которого должны использоваться при вызове конструктора родительского класса super().
    Basket - класс для хранения данных о корзине товаров со свойствами:
        goods       массив объектов класса BasketGood для хранения данных о товарах в корзине
Реализуйте геттеры:
        get totalAmount()  возвращает общую стоимость товаров в корзине
        get totalSum()     возвращает общее количество товаров в корзине
При реализации геттеров используйте методы массивов, такие как reduce() и forEach().
Реализуйте методы:
        add(good, amount)    Добавляет товар в корзину, если товар уже есть увеличивает количество
        remove(good, amount) Уменьшает количество товара в корзине, если количество становится равным нулю, товар удаляется
        clear()              Очищает содержимое корзины
        removeUnavailable()  Удаляет из корзины товары, имеющие признак available === false (использовать filter())
    В основном коде программы создайте не менее 5 экземпляров класса Good. Создайте экземпляры классов GoodsList и Basket.
    Вызовите несколько раз реализованные методы этих объектов с необходимыми аргументами,
    устанавливая условия фильтрации и сортировки для GoodsList.
    Выведите в консоль отфильтрованный и сортированный каталог товаров, а также значения общих суммы и количества товаров в корзине.

Правила приема работы
    Задание необходимо сдавать в виде ссылки на репозиторий в github, содержащий файлы с кодом для каждого из заданий.
    В случае создания отдельной ветки (branch) для заданий к каждому уроку ссылка, прикрепленная в личном кабинете,
    должна быть на ветку, содержащую решение данного задания.

Критерии оценки
    К заданию прикреплена ссылка на ветку в репозитории, содержащую файлы с кодом для задания 1.
    Код в файлах соответствует заданию и при выполнении не вызывает ошибок времени компиляции или выполнения.
    В случае необходимости запуска кода с определенными параметрами командной строки, это должно быть описано в виде комментариев в коде.
 */


class Good {
    constructor (id, name, description, sizes, price, available) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sizes = sizes;
        this.price = price;
        this.available = available;
    }
    setAvailable (available) {
        if (available === true || available === false) {
            this.available = available;
        }
    }
}

class GoodsList {
    #goods;
    constructor(filter, sortPrice, sortDir) {
        this.#goods = [];
        this.filter = filter;
        this.sortPrice = sortPrice;
        this.sortDir = sortDir;
    }
    get list() {
        let filtered = this.#goods.filter(({good}) => good.name.match(this.filter));
        if (this.sortPrice === true) {
            if (this.sortDir === true) {
                return filtered.sort((a, b) => a.good.price - b.good.price)
            } else {
                return filtered.sort((a, b) => b.good.price - a.good.price)
            }
        } else {
            return filtered
        }
    }
    add(good) {
        return this.#goods.push({good})
    }
    remove(id) {
        for (let i = 0; i < this.#goods.length; i++) {
            if (this.#goods[i]['good']['id'] === id) {
                return this.#goods.splice(i, 1);
            }
        }
    }
}

class BasketGood extends Good {
    constructor(id, name, description, sizes, price, available, amount) {
        super(id, name, description, sizes, price, available);
        this.amount = amount;
    }
}

class Basket {
    constructor(goods) {
        this.goods = [];
    }
    get totalAmount() {
        if (this.goods.length > 0) {
            const totalAmount = this.goods.reduce(
                function (sum, current) {
                    return sum + current.good.price
                }, 0
            );
            return {
                'totalAmount': totalAmount,
            }
        }
    }
    get totalSum() {
        if (this.goods.length > 0) {
            let totalSum = 0;
            this.goods.forEach(function (gs) {
                totalSum += gs.amount;
            });
            return {
                'totalSum': totalSum,
            }
        }
    }
    add(good, amount) {
        if (this.goods.length === 0) {
            return this.goods.push({good, amount})
        }
        for (let i = 0; i < this.goods.length; i++) {
                if (this.goods[i].good.id === good.id) {
                    return this.goods[i].amount += amount
                } else {
                    return this.goods.push({good, amount})
                }
       }
    }
    remove(good, amount) {
        if (this.goods.length > 0) {
            for (let i = 0; i < this.goods.length; i++) {
                if (this.goods[i].good.id === good.id) {
                    if (this.goods[i].amount > amount) {
                        return this.goods[i].amount -= amount
                    } else {
                        return this.goods.splice(i, 1)
                    }
                }
            }
        }
    }
    clear() {
        return this.goods.length = 0
    }
    removeUnavailable() {
        if (this.goods.length > 0) {
            let available = this.goods.reduce(function (newArr, current) {
                if (current.good.available === true) {
                    newArr.push(current);
                }
                return newArr;
            }, []);
            return this.goods = available
        }
    }
}


let a = new Good(1, 'Товар раз', 'Описание раз', ['X', 'M', 'L',], 1500, true);
let b = new Good(2, 'Товар два', 'Описание два', ['X', 'M', 'L',], 800, false);
let c = new Good(3, 'Товар три', 'Описание три', ['38', '39', '42',], 1900, true);
let d = new Good(4, 'Товар три и один', 'Описание три и один', ['42',], 1979, true)
let e = new Good(5, 'Пятый элемент', 'Описание пятый', ['XS', 'S', 'XL',], 1997, true)
let f = new Good(6, 'Товар шесть', 'Описание шесть', ['25', '27', '29',], 12, true)
let g = new Good(7, 'Товар 7', 'Товар с некорректным наименованием', ['54', '56',], 100500, false)

g.setAvailable(true)

const filter = /^[A-я]+( [A-я]+)*$/

let l = new GoodsList(filter, true, true)
l.add(a)
l.add(b)
l.add(c)
l.add(d)
l.add(e)
l.add(f)
l.add(g)

console.log(l.list)
// l.remove(2)

let basket = new Basket()
basket.add(a, 5)
basket.add(a, 5)
basket.add(a, 5)
basket.add(b, 4)
basket.add(c, 3)
basket.add(d, 2)
basket.add(e, 1)
basket.add(f, 1)

// console.log(basket)
// basket.clear()
// console.log(basket.goods)

console.log(basket.totalAmount)
console.log(basket.totalSum)

basket.remove(a, 2)
basket.remove(c, 3)
basket.removeUnavailable()
console.log(basket.goods)
