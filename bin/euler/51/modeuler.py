def digits(num): return  [int(t) for t in str(num)]
def resum(lst): return reduce(lambda x,y:10*x+y,lst)
def dupes(lst): return len(lst) - len(set(lst))
def zero(lst): return ((0 in lst))

def timeit(f,iter=1,ms=False):
    from time import time
    a = time()
    for _ in xrange(iter): assert(f)
    b = time()
    return (b-a)* ( 1000 if ms else 1 )
    
def isprime(num):
    if num <= 1: return 0           # 1, 0, negative integer not prime
    if num < 4 : return 1           # 2,3 prime
    if num % 2 == 0: return 0       # 4,6,8,... composite
    if num < 9 : return 1           # 5,7 prime
    if num % 3 == 0: return 0       # 9,12,15,... composite
    last = int((num)**(0.5))+1
    for k in range(5,last,6):      # all other primes == -1,1 mod 6
        if num % k == 0: return 0   # (5),11,17,...
        if num % (k+2) == 0: return 0   # (7),13,15,...
    return 1

def primes2(num):
    for i in [2]+range(3,num,2):
        if isprime(i): yield i

def primes(num):
    cand = [0,0,2,3,0] + [x for x in range(5,num)]
    for i in range(2,num):
        if cand[i]: 
            yield i
            for k in cand[i+i::i]: 
                if not (k % i): cand[k] = 0

def divisors(num):
    r = [1]
    last = int(num**0.5)+1
    for k in range(2,last):
        if not num % k: 
            r.append(k)
            if not (num // k == k):
                r.append(num//k) 
    return sorted(r)

def factor(num):
    list=[]
    y = num
    k = 5
    while y > 1:
        while y % 2 == 0: 
            y /= 2
            list.append(2)
        while y % 3 == 0: 
            y /= 3
            list.append(3)
        while y % k == 0: 
            y /= k
            list.append(k)
        while y % (k+2) == 0: 
            y /= (k+2)
            list.append((k+2))
        k += 6
    return sorted(list)

def perm(items):
    if len(items) == 2: return [''.join(items), ''.join(items[::-1])]
    result = []
    for i in range(len(items)):
        p_list = permutations(items[:i] + items[i + 1:])
        for p in p_list:
            result.append(items[i] + p)
    return result

def mult(a,b):
    c,d = str(a),str(b)
    p,q = len(c),len(d)
    r = p+q
    x = [int(c[z]) for z in reversed(range(p))] #+[0 for z in range(q)]
    y = [int(d[z]) for z in reversed(range(q))]
    res = [0 for z in range(r)]

 #    y = d
 #   carry=0
 #   for i in xrange(r):
 #       res[i] = int(x[i]) * b + carry
 #       carry = (res[i]//10)
 #       res[i] %=10

    for i in (range(p)):
        for j in (range(q)):
            res[i+j] += x[i]*y[j]
    for i in range(r-1):
            res[i+1] += (res[i] // 10)
            res[i] = res[i] % 10
    return ''.join(reversed([str(x) for x in res]))
        
def loadfile(name):
    f = open(name,'r')
    a=b=[]
    lines = 0
    for line in f:
        b = (line.strip())
        a.append(b)
        lines += 1
    f.close()
    return(a)

