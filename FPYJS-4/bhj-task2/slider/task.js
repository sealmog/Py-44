
const Item = document.querySelectorAll('.slider__item');
const Dot = document.querySelectorAll('.slider__dot');
let index = 0

document.querySelector('.slider__arrow_next').onclick = (event) => {
    if (index < Item.length - 1) {
        Item.item(index).classList.remove('slider__item_active')
        Item.item(index + 1).classList.add('slider__item_active')

        Dot.item(index).classList.remove('slider__dot_active')
        Dot.item(index + 1).classList.add('slider__dot_active')

        dt(index)

    } else {

        Item.item(index).classList.remove('slider__item_active')
        Item.item(0).classList.add('slider__item_active')

        Dot.item(index).classList.remove('slider__dot_active')
        Dot.item(0).classList.add('slider__dot_active')

        dt(index)

        index = -1
    }
    index++
}

document.querySelector('.slider__arrow_prev').onclick = (event) => {
    if (index > 0) {
        Item.item(index).classList.remove('slider__item_active')
        Item.item(index - 1).classList.add('slider__item_active')

        Dot.item(index).classList.remove('slider__dot_active')
        Dot.item(index - 1).classList.add('slider__dot_active')

        dt(index)

    } else {
        Item.item(index).classList.remove('slider__item_active')
        Item.item(Item.length - 1).classList.add('slider__item_active')

        Dot.item(index).classList.remove('slider__dot_active')
        Dot.item(Item.length - 1).classList.add('slider__dot_active')

        dt(index)

        index = Item.length
    }
    index--
}

function dt(index) {
    Dot[index].onclick = function () {
        let current = document.getElementsByClassName("slider__item_active")[0]
        current.className = "slider__item";
        const Dots = Array.from(Dot);
        const Items = Array.from(Item);
        let d = Dots.indexOf(this);
        Items[d].className = "slider__item slider__item_active";
        this.className = "slider__dot slider__dot_active";
        Dots.forEach(element => {
            if (element != this) {
                element.className = "slider__dot";
            }
        });
    }
}
