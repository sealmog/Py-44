/*
В отдельном файле с расширением .js напишите программу, реализующую игру "угадай число" с подсказками "больше" и "меньше".
Программа должна реализовывать вариант игры, состоящей из множества попыток до точного угадывания числа пользователем.
Программа должна вести счетчик количества попыток и информировать пользователя о номере текущей попытки и
общем количестве попыток при завершении игры.

Для ввода чисел от пользователя используйте функции библиотеки reaLine, использующие коллбэки (не использующие promise).

(*)(не обязательное задание) Реализуйте запись протокола игры с сохранением вводимых значений и ответов программы во внешний файл.
Для этого познакомьтесь с функциями библиотеки fs, такими как fs.writeFile, fs.promises.writeFile, fs.writeFileSync и
их вариантами дополняющими файл вместо перезаписи fs.appendFile: https://nodejs.org/api/fs.html
 */

const rl = require('readline').createInterface(process.stdin, process.stdout)
let n = Math.floor(Math.random() * 10);
let a = 1
const fs = require('fs');

function writeLog(log) {
    fs.appendFile("guess_v1.txt", log,(err) => {
        if (err) {
            console.log(err);
        }
    });
}

function question() {
    rl.question('Guess number from 0 to 10, or "q" for exit, try #' + a + ': ', (cmd) => {
        if (cmd == 'q') {
            writeLog('Entered "q"\n')
            rl.close();
            return
        } else if ((isNaN(cmd)) || (cmd == '')|| (+cmd < 0) || (+cmd > 10)) {
            let txt = 'Incorrect number'
            console.log(txt);
            writeLog(txt + '\n')
        } else if (+cmd > n) {
            let txt = 'less then ' + cmd
            console.log(txt);
            writeLog(txt + '\n')
            a++
        } else if (+cmd < n) {
            let txt = 'more then ' + cmd
            console.log(txt);
            writeLog(txt + '\n')
            a++
        } else if (+cmd === n) {
            let txt = 'right! number is: ' + cmd + ' total attempts: ' + a
            console.log(txt);
            writeLog(txt + '\n')
            rl.close();
            return;
        }
        question();
    })
}

question();
