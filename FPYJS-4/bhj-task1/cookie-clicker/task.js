
let c = document.getElementById('cookie');
let cc = document.getElementById('clicker__counter');
let cs = document.getElementById('clicker__score');
let prev = new Date();

function clicksPerSecond(start, prev) {
    return (1 / (start - prev) * 1000).toFixed(2);
}

c.onclick = () => {
    let start = new Date();
    cc.textContent++
    if (cc.textContent % 2) {
        c.width *= 1.2
        c.height *= 1.2
    } else {
        c.width /= 1.2
        c.height /= 1.2
    }

    cs.textContent = clicksPerSecond(start, prev)
    prev = start
}
