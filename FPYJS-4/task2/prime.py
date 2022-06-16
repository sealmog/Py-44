import sys
import time


start_time = time.time()
input = int(sys.argv[1])

def is_prime(num):
    for i in range(2, num):
        if i * i <= num:
            if num % i == 0:
                return False
            i += 1
    return num > 1

def prime_arr(input):
    arr = []
    [arr.append(i) for i in range(2, input+1) if is_prime(i) is True]
    return arr

print(prime_arr(input))
print(f'{(time.time() - start_time):.3f} seconds')
