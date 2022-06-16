/*
Реализуйте функции добавления товара в корзину и удаления одного товара из нее, а также функцию полной очистки корзины.

Реализуйте функцию вычисления общего количества и стоимости товаров в корзине.
Функция должна возвращать объект, содержащий поля:

totalAmount    Общее количество товаров в корзине
totalSumm      Общая стоимость товаров в корзине

В основном коде программы вызовите несколько раз реализованные функции с необходимыми аргументами.
В конце вызовите функцию подсчета сумм и результат ее выполнения выведите в консоль.
 */

const goods = {
    1: {
        id: 1,
        name: 'Товар раз',
        description: 'Описание раз',
        sizes: ['X', 'M', 'L',],
        price: 500,
        available: true
    },
    2: {
        id: 2,
        name: 'Товар два',
        description: 'Описание два',
        sizes: ['X', 'M', 'L',],
        price: 800,
        available: false
    },
    3: {
        id: 3,
        name: 'Товар три',
        description: 'Описание три',
        sizes: ['38', '39', '42',],
        price: 1900,
        available: true
    },
    4: {
        id: 4,
        name: 'Товар три и один',
        description: 'Описание три и один',
        sizes: ['42',],
        price: 1979,
        available: true
    },
    5: {
        id: 5,
        name: 'Пятый элемент',
        description: 'Описание пятый',
        sizes: ['XS', 'S', 'XL',],
        price: 1997,
        available: true
    },
    6: {
        id: 6,
        name: 'Товар шесть',
        description: 'Описание шесть',
        sizes: ['25', '27', '29',],
        price: 12,
        available: true
    },
}
// const catalog = [ goods[1], goods[2], goods[3], goods[4], goods[5], goods[6] ]
const cart = [
    {
        good: 1,
        amount: 1,
    },
    {
        good: 2,
        amount: 2,
    },
    {
        good: 3,
        amount: 3,
    },
]

function addToCart(cart, good, amount) {
    if (goods[goodID]['available'] === true)  {
        return cart.push({good, amount})
    }
}

function deleteFromCart(cart, good) {
    for (let i = 0; i < cart.length; i++) {
        if (cart[i]['good'] === good) {
            return cart.splice(i, 1)
        }
    }
}

function cleanCart(cart) {
    return cart.length = 0
}

function cartAmount(cart) {
    let totalAmount = 0
    let totalSumm = 0
    for (let i = 0; i < cart.length; i++) {
        totalAmount += cart[i]['amount'];
        totalSumm += 1;
    }
    return {
        'totalAmount': totalAmount,
        'totalSumm': totalSumm,
    }
}


let goodID = 5

console.log(cart);
addToCart(cart, goodID, 4);
console.log(cart);

goodID = 3

deleteFromCart(cart, goodID);
console.log(cart);

console.log(cartAmount(cart));

cleanCart(cart);
console.log(cart);
