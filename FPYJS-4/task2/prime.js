console.time()
input = process.argv[2]

function isPrime(num) {
    for (let i = 2; i * i <= num; i++)
        if (num % i === 0)
            return false;
    return num > 1;
}

function primeArr(input) {
    let arr = []
    for (let i = 2; i <= input; i++) {
        if (isPrime(i) === true) {
            arr.push(i);
        }
    }
    return arr
}

console.log(primeArr(input));
console.timeEnd()
