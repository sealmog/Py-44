let m = 1000
let n = Math.floor(Math.random() * m);

message = 'Угадай число от 0 до ' + m

while (true) {
    const userGuess = prompt(message);

    if (userGuess === 'q') {
        break;
    } else if (isNaN(userGuess) || (+userGuess < 0) || (+userGuess > m)) {
        alert('Некорректное число, повторите ввод или "q" для выхода');
    } else if (+userGuess > n) {
        alert('Меньше');
    } else if (+userGuess < n) {
        alert('Больше');
    } else {
        alert('Верно!');
        break
    }
}
