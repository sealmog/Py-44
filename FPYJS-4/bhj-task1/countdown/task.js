
let t = document.getElementById('timer')
let oldDate = new Date();
let newDate = new Date();
let countDown = newDate.setTime(oldDate.getTime() + (+t.textContent * 1000));

let x = setInterval(function() {
    let now = new Date().getTime();
    t.textContent = countDown;
    let distance = countDown - now;
    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((distance % (1000 * 60)) / 1000);
    t.textContent = hours + "h " + minutes + "m " + seconds + "s ";

    if (distance < 0) {
            alert('Вы победили в конкурсе')
            clearInterval(x);
            location.reload();
        }
}, 1000);
