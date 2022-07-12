const Main = document.querySelectorAll(".menu__link");

Main.forEach(Item => {
    Item.onclick = () => {
        let menuActive = document.querySelectorAll(".menu_active");
        if (Item.closest(".menu__item").querySelector(".menu_sub") != null) {
            Item.closest(".menu__item").querySelector(".menu_sub").classList.toggle("menu_active");
            if (menuActive.length > 0) {
                menuActive[0].classList.remove("menu_active");
            }
            return false;
        }
    }
});
