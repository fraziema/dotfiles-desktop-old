class Digits(object):
    def digits(self,num): return [int(t) for t in str(num)]
    def resum(self,lst): return reduce(lambda x,y:10*x+y,lst)
    def dupes(self,lst): return len(lst) - len(set(lst))
    def zero(self,lst): return ((0 in lst))
   
    def __init__(self,num): 
        self.dig = self.digits(num)
        self.dup = self.dupes(self.dig)
        self.z = self.zero(self.dig)
        self.res = self.resum(self.dig)
    
    def update(self,lst): self.__init__(self.resum(lst))
    

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

def primes(num):

    def sieve(n):
        if type(n) != int and type(n) != long:
            raise TypeError('must be integer')
        if n < 2:
            raise ValueError('must be greater than one')
        m = (n-1) // 2
        b = [True] * m
        i, p, ps = 0, 3, [2]
        while p*p < n:
            if b[i]:
                ps.append(p)
                j = 2*i*i + 6*i + 3
                while j < m:
                    b[j] = False
                    j = j + 2*i + 3
            i += 1; p += 2
        while i < m:
            if b[i]:
                ps.append(p)
            i += 1; p += 2
        return ps

    if num < 10**6:
        for x in sieve(num): yield x
    else:
        for x in sieve(10**6): yield x
        for y in xrange(10**6 + 1,num,6):
            if isprime(y): yield y
            if isprime(y+2): yield y+2

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


def rho(num): # return ~a~ factor (possibly composite) using rho algorithm
    # see primenumbers.pdf from http://programmingpraxis.com/essays
    def f(x,c,n): return (x*x + c)%n # rng
    def gcd(a,b): while b: a,b=b,a%b ; return abs(a)
    c = 1 
    while True:
        t=2; h=2; d=1; #init 
        while d == 1: # two loops, looking for random divisors of num
            t = f(t,c,num)
            h = f(f(h,c,num),c,num)
            d = gcd(t-h,num)
        if d < num and d > 0: return d # d is a factor if found
        c += 1 # else t and h loops collided; inc rng start and retry

def perm(items):
    if len(items) == 2: return [''.join(items), ''.join(items[::-1])]
    result = []
    for i in range(len(items)):
        p_list = perm(items[:i] + items[i + 1:])
        for p in p_list:
            result.append(items[i] + p)
    return result

#def mult(a,b):
#    c,d = str(a),str(b)
#    p,q = len(c),len(d)
#    r = p+q
#    x = [int(c[z]) for z in reversed(range(p))] #+[0 for z in range(q)]
#    y = [int(d[z]) for z in reversed(range(q))]
#    res = [0 for z in range(r)]
#
# #    y = d
# #   carry=0
# #   for i in xrange(r):
# #       res[i] = int(x[i]) * b + carry
# #       carry = (res[i]//10)
# #       res[i] %=10
#
#    for i in (range(p)):
#        for j in (range(q)):
#            res[i+j] += x[i]*y[j]
#    for i in range(r-1):
#        res[i+1] += (res[i] // 10)
#        res[i] = res[i] % 10
#    return ''.join(reversed([str(x) for x in res]))
#
#def loadfile(name):
#    f = open(name,'r')
#    a=b=[]
#    lines = 0
#    for line in f:
#        b = (line.strip())
#        a.append(b)
#        lines += 1
#    f.close()
#    return(a)
#
