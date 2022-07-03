/*
В отдельном файле с расширением .js напишите программу, реализующую функционал из задания 2,
но использующую promise вместо коллбэков либо в форме вызовов .then, либо async/await.

(*)(не обязательное задание) Реализуйте собственную промисную обертку для функции rl.question,
не используя готовую функцию из promise API библиотеки readline. Используйте эту обертку для реализации игры
 */

const rl = require('readline').createInterface(process.stdin, process.stdout)
let n = Math.floor(Math.random() * 10);
let a = 1

function queststion (q) {
    return new Promise((resolve, reject) => {
        rl.question(q, (data) => {
            resolve(data);
        })
    })
}

async function input() {
    let q = queststion('Guess number from 0 to 10, or "q" for exit, try #' + a + ': ');
    q.then((cmd) => {
        if (cmd == 'q') {
            rl.close();
        } else if ((isNaN(cmd)) || (cmd == '')|| (+cmd < 0) || (+cmd > 10)) {
            let txt = 'Incorrect number'
            console.log(txt);
            input();
        } else if (+cmd > n) {
            let txt = 'less then ' + cmd
            console.log(txt);
            a++
            input();
        } else if (+cmd < n) {
            let txt = 'more then ' + cmd
            console.log(txt);
            a++
            input();
        } else if (+cmd === n) {
            let txt = 'right! number is: ' + cmd + ' total attempts: ' + a
            console.log(txt);
            rl.close();
        }
    })
}

input()
