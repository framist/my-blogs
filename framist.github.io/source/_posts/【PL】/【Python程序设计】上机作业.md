---
title: 【Python 程序设计】上机作业 - 人类高质量代码
date: 2021-6-2
categories:
  - 计算机科学
  - 课业学习
  - Python
tags:
  - Python
  - 学习
abbrlink: 12455
---



# 【Python 程序设计】上机作业

有些代码是嫖的，但大部分代码尽自己可能尝试以最简单或是最有趣的方式实现。

~~Python 课自然是没有听的，肯定有更好更规范的写法，欢迎讨论~~

目录：

- [【Python 程序设计】上机作业](#python-程序设计上机作业)
- [【Python】第一次上机报告](#python第一次上机报告)
  - [1）安装 Python，使用 Python 解释器。](#1安装-python使用-python-解释器)
  - [2）简单的加减乘除运算，调用标准模块 math 中的数学函数。](#2简单的加减乘除运算调用标准模块-math-中的数学函数)
  - [3）编写和运行 Python 脚本。](#3编写和运行-python-脚本)
  - [4）编写程序，生成包含 1000 个 0 到 100 之间的随机整数，并统计每个元素的出现次数。](#4编写程序生成包含-1000-个-0-到-100-之间的随机整数并统计每个元素的出现次数)
  - [5）编写程序，生成包含 20 个随机数的列表，然后将前 10 个元素升序排列，后 10 个元素降序排列，并输出结果。](#5编写程序生成包含-20-个随机数的列表然后将前-10-个元素升序排列后-10-个元素降序排列并输出结果)
  - [6）编写程序，运行后用户输入 4 位整数作为年份，判断其是否为闰年。如果年份能被 400 整除，则为闰年；如果年份能被 4 整除但不能被 100 整除也为闰年。](#6编写程序运行后用户输入-4-位整数作为年份判断其是否为闰年如果年份能被-400-整除则为闰年如果年份能被-4-整除但不能被-100-整除也为闰年)
- [【Python】第二次上机报告](#python第二次上机报告)
  - [例 4-1 编写函数实现字符串加密和解密，循环使用指定密钥，采用简单的异或算法](#例-4-1-编写函数实现字符串加密和解密循环使用指定密钥采用简单的异或算法)
    - [添加注释：](#添加注释)
    - [使用 zip() 函数：](#使用-zip-函数)
    - [函数式编程的写法：](#函数式编程的写法)
    - [优化代码，使用 base64，使不可见字符可见](#优化代码使用-base64使不可见字符可见)
  - [例 4-2 编写程序，生成大量随机信息，这在需要获取大量数据来测试或演示软件功能的时候非常有用，不仅能真实展示软件功能或算法，还可以避免泄露真实数据或者引起不必要的争议。](#例-4-2-编写程序生成大量随机信息这在需要获取大量数据来测试或演示软件功能的时候非常有用不仅能真实展示软件功能或算法还可以避免泄露真实数据或者引起不必要的争议)
  - [例 4-3 检查并判断密码字符串的安全强度。这实际上是一个分类问题。](#例-4-3-检查并判断密码字符串的安全强度这实际上是一个分类问题)
  - [例 4-4 编写程序，把一个英文句子中的单词倒置，标点符号不倒置，例如 I like beijing. 经过函数后变为：beijing. like I](#例-4-4-编写程序把一个英文句子中的单词倒置标点符号不倒置例如-i-like-beijing-经过函数后变为beijing-like-i)
  - [例 4-5 编写程序，查找一个字符串中最长的数字子串](#例-4-5-编写程序查找一个字符串中最长的数字子串)
- [【Python】第三次上机报告](#python第三次上机报告)
  - [1）编写函数，接收一个字符串，分别统计大写字母、小写字母、数字、其他字符的个数，并以元组的形式返回结果。](#1编写函数接收一个字符串分别统计大写字母小写字母数字其他字符的个数并以元组的形式返回结果)
  - [2）编写函数，可以接收任意多个整数并输出其中的最大值和所有整数之和。](#2编写函数可以接收任意多个整数并输出其中的最大值和所有整数之和)
  - [3）编写函数，模拟内置函数 sorted()。](#3编写函数模拟内置函数-sorted)
  - [4）用字典建立一个通讯录，向字典中添加和删除通讯人（名字、电话、邮箱、工作单位等），查询某个人的信息，然后输出通讯录中所有人的信息。](#4用字典建立一个通讯录向字典中添加和删除通讯人名字电话邮箱工作单位等查询某个人的信息然后输出通讯录中所有人的信息)
  - [5）用生成器的方式计算任意起止范围内质数的和。质数，又称素数，是大于 1 的自然数，除了 1 和它本身外，不能被其他自然数整除。](#5用生成器的方式计算任意起止范围内质数的和质数又称素数是大于-1-的自然数除了-1-和它本身外不能被其他自然数整除)
- [【Python】第四次上机报告](#python第四次上机报告)
  - [实现一个栈（Stack）的类](#实现一个栈stack的类)
  - [形状的类](#形状的类)

![Image](https://pic4.zhimg.com/80/v2-160aa1b6ef8ced6ca18584164864428a.png)

<!--more-->

# 【Python】第一次上机报告

## 1）安装 Python，使用 Python 解释器。

```bash
$ python
```

## 2）简单的加减乘除运算，调用标准模块 math 中的数学函数。

```python
>>> 0.1+0.2
0.30000000000000004
>>> 0.3-0.1
0.19999999999999998
>>> 0.1*0.2
0.020000000000000004
>>> 1/0
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ZeroDivisionError: division by zero
>>> import math
>>> math.sqrt(-1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module> 
ValueError: math domain error
```



## 3）编写和运行 Python 脚本。

```bash
$ python a.py
```

## 4）编写程序，生成包含 1000 个 0 到 100 之间的随机整数，并统计每个元素的出现次数。

```python
import random
x = [random.randint(1,100) for _ in range(1000)]
print({i:x.count(i) for i in set(x)})
```



## 5）编写程序，生成包含 20 个随机数的列表，然后将前 10 个元素升序排列，后 10 个元素降序排列，并输出结果。

```python
import random
x = [random.randint(1,100) for _ in range(20)]
print(sorted(x[:10])+sorted(x[11:],reverse=True))
```

## 6）编写程序，运行后用户输入 4 位整数作为年份，判断其是否为闰年。如果年份能被 400 整除，则为闰年；如果年份能被 4 整除但不能被 100 整除也为闰年。

使用了海象运算符赋值，故需 python 版本>=3.8

```python
print('闰年' if ((year:=int(input("请输入年份：")))%4==0 and year%100!=0) or year%400==0 else '平年')
```



或者使用`calendar`

 ```python
import calendar
print('闰年' if calendar.isleap(int(input("输入年份："))) else '平年')
 ```



# 【Python】第二次上机报告

> 5 月 6 号上机后的作业是“字符串 1”中的例题，因为**代码已给出**,所以要求同学们写注释，验证代码是否有问题，写有关程序的思考 (如初始看到题目，你是准备怎么实现的)。



## 例 4-1 编写函数实现字符串加密和解密，循环使用指定密钥，采用简单的异或算法

### 添加注释：

```python
def crypt(source, key):
    from itertools import cycle
    '''
    (class) cycle(__iterable: Iterable):
    Return elements from the iterable until it is exhausted. 
    Then repeat the sequence indefinitely.
    '''
    result = ''
    temp = cycle(key)
    for ch in source:
        '''
        next(iterator[, default]):
        Return the next item from the iterator. 
        If default is given and the iterator is exhausted, 
        it is returned instead of raising StopIteration.
        '''
        result = result + chr(ord(ch) ^ ord(next(temp)))
    return result

source = 'Xidian University' # 原文
key    = 'CS' # 秘钥

print('Before Encrypted:'+source)
encrypted = crypt(source, key)
print('After Encrypted:'+encrypted)
decrypted = crypt(encrypted, key)
print('After Decrypted:'+decrypted)
```

### 使用 zip() 函数：

```python
def crypt(source, key):
    from itertools import cycle
    '''
    (class) cycle(__iterable: Iterable):
    Return elements from the iterable until it is exhausted. 
    Then repeat the sequence indefinitely.
    '''    
    result = ''
    temp = cycle(key)
    for ch, key in zip(source, temp):
        result = result + chr(ord(ch) ^ ord(key))
    return result



source = 'Xidian University' # 原文
key    = 'CS' # 秘钥

print('Before Encrypted:'+source)
encrypted = crypt(source, key)
print('After Encrypted:'+encrypted)
decrypted = crypt(encrypted, key)
print('After Decrypted:'+decrypted)
```

### 函数式编程的写法：

```python
def crypt(source, key):
    from itertools import cycle
    func = lambda x, y: chr(ord(x)^ord(y)) # 函数式编程
    return ''.join(map(func, source, cycle(key)))

source = 'Beautiful is better than ugly.'
key = 'Python'

print('Before Encrypted:'+source)
encrypted = crypt(source, key)
print('After Encrypted:'+encrypted)
decrypted = crypt(encrypted, key)
print('After Decrypted:'+decrypted)

```

### 优化代码，使用 base64，使不可见字符可见

```python
from base64 import b64encode

def crypt(source, key):
    from itertools import cycle
    func = lambda x, y: chr(ord(x)^ord(y)) # 函数式编程
    return ''.join(map(func, source, cycle(key)))

source = 'Beautiful is better than ugly.'
key = 'Python'

print('Before Encrypted:'+source)
encrypted = crypt(source, key)
print('After Encrypted (base64enc):')
print(b64encode(bytes(encrypted,encoding='utf8'))) # base64 编码
decrypted = crypt(encrypted, key)
print('After Decrypted:'+decrypted)
```



## 例 4-2 编写程序，生成大量随机信息，这在需要获取大量数据来测试或演示软件功能的时候非常有用，不仅能真实展示软件功能或算法，还可以避免泄露真实数据或者引起不必要的争议。

```python
import random
import string
import codecs

# 常用汉字 Unicode 编码表（部分），完整列表详见配套源代码
StringBase = '\u7684\u4e00\u4e86\u662f\u6211\u4e0d\u5728\u4eba'


def getEmail():
    # 常见域名后缀，可以随意扩展该列表
    suffix = ['.com', '.org', '.net', '.cn']
    characters = string.ascii_letters+string.digits+'_'
    username = ''.join((random.choice(characters)
                        for i in range(random.randint(6, 12))))
    domain = ''.join((random.choice(characters)
                      for i in range(random.randint(3, 6))))
    return username+'@'+domain+random.choice(suffix)


def getTelNo():
    return ''.join((str(random.randint(0, 9)) for i in range(11)))


def getNameOrAddress(flag):
    '''flag=1 表示返回随机姓名，flag=0 表示返回随机地址'''
    result = ''
    if flag == 1:
        # 大部分中国人姓名在 2-4 个汉字
        rangestart, rangeend = 2, 4
    elif flag == 0:
        # 假设地址在 10-30 个汉字之间
        rangestart, rangeend = 10, 30
    else:
        print('flag must be 1 or 0')
        return ''
    for i in range(random.randint(rangestart, rangeend)):
        result += random.choice(StringBase)
    return result


def getSex():
    return random.choice(('男', '女'))


def getAge():
    return str(random.randint(18, 100))


def main(filename):
    with codecs.open(filename, 'w', 'utf-8') as fp:
        # 虽然内置的 open() 和相关联的 io 模块是操作已编码文本文件的推荐方式，
        # 但 codecs.open 也提供了额外的工具函数和类，
        # 允许在操作二进制文件时使用更多各类的编解码器：
        fp.write('Name,Sex,Age,TelNO,Address,Email\n')
        # 随机生成 200 个人的信息
        for i in range(200):
            name = getNameOrAddress(1)
            sex = getSex()
            age = getAge()
            tel = getTelNo()
            address = getNameOrAddress(0)
            email = getEmail()
            line = ','.join([name, sex, age, tel, address, email]) + '\n'
            fp.write(line)


def output(filename):
    with codecs.open(filename, 'r', 'utf-8') as fp:
        while True:
            line = fp.readline()
            if not line:
                return
            line = line.split(',')
            for i in line:
                print(i, end=',')
            print()


if __name__ == '__main__':
    filename = 'information.txt'
    main(filename)
    output(filename)

```



## 例 4-3 检查并判断密码字符串的安全强度。这实际上是一个分类问题。

```python
import string

def check(pwd):
    # 密码必须至少包含 6 个字符
    if not isinstance(pwd, str) or len(pwd) < 6:
        return 'not suitable for password'
    # 密码强度等级与包含字符种类的对应关系
    d = {1: 'weak', 2: 'below middle', 3: 'above middle', 4: 'strong'}
    # 分别用来标记 pwd 是否含有数字、小写字母、大写字母和指定的标点符号
    r = [False] * 4

    for ch in pwd:
        # 是否包含数字
        if not r[0] and ch in string.digits:
            r[0] = True
        # 是否包含小写字母
        elif not r[1] and ch in string.ascii_lowercase:
            r[1] = True
        # 是否包含大写字母
        elif not r[2] and ch in string.ascii_uppercase:
            r[2] = True
        # 是否包含指定的标点符号
        elif not r[3] and ch in ',.!;?<>':
            r[3] = True
    # 统计包含的字符种类，返回密码强度
    # get(key[, default]):
    # 如果 key 存在于字典中则返回 key 的值，否则返回 default。
    # 如果 default 未给出则默认为 None，因而此方法绝不会引发 KeyError。
    return d.get(r.count(True), 'error')


print(check('a2C233d'))
```

## 例 4-4 编写程序，把一个英文句子中的单词倒置，标点符号不倒置，例如 I like beijing. 经过函数后变为：beijing. like I

添加了强制类型：

```python
# str.split(sep=None, maxsplit=-1):
# 如果 sep 未指定或为 None，则会应用另一种拆分算法：
# 连续的空格会被视为单个分隔符，
# 其结果将不包含开头或末尾的空字符串，
# 如果字符串包含前缀或后缀空格的话。 
# 因此，使用 None 拆分空字符串或仅包含空格的字符串将返回 []。

def rev1(s: str):
    return ' '.join(reversed(s.split()))

def rev2(s: str):
    t = s.split()
    t.reverse()
    return ' '.join(t)

def rev5(s: str):
    '''字符串整体逆序，分隔，再各单词逆序'''
    t = ''.join(reversed(s)).split()
    t = map(lambda x: ''.join(reversed(x)), t)
    return ' '.join(t)


s = 'I like beijing.'
print(rev1(s))
print(rev2(s))
print(rev5(s))
```

输出：

`beijing. like I`

`beijing. like I`

`beijing. like I`

## 例 4-5 编写程序，查找一个字符串中最长的数字子串

```python
def longest(s):
    result = []
    t = []
    for ch in s:                      # 遍历字符串中所有字符
        if '0' <= ch <= '9':              # 遇到数字，记录到临时变量
            t.append(ch)
        elif t:
            result.append(''.join(t))  # 遇到非数字，把临时的连续数字记下来
            t = []
    if t:                             # 考虑原字符串以数字结束的情况
        result.append(''.join(t))

    if result:
        return max(result, key=len)
    return 'No'

ss = ('111abc2d3', 'abc111111d', 'a2bc11111111')
for s in ss:
    print(s, longest(s), sep=':')

```

输出：

`111abc2d3:111`

`abc111111d:111111`

`a2bc11111111:11111111`



选择法：

```python
# 选择法 def longest(s: str):    length = len(s)    start = 0    span = (0, 0)    for pos in range(length):        if s[pos].isdigit() and (pos == 0 or not s[pos-1].isdigit()):            start = pos        elif ((not s[pos].isdigit()) and s[pos-1].isdigit()              and pos-start > span[1]-span[0]):            span = (start, pos-1)    # 字符串以数字结束的情况    if s[pos].isdigit() and pos-start >= span[1]-span[0]:        span = (start, pos)    return s[span[0]:span[1]+1]ss = ('111abc2d3', 'abc111111d', 'a2bc11111111')for s in ss:    print(s, longest(s), sep=':')
```

# 【Python】第三次上机报告

> 第三次实验作业
>
> 1）编写函数，接收一个字符串，分别统计大写字母、小写字母、数字、其他字符的个数，并以元组的形式返回结果。
>
> 2）编写函数，可以接收任意多个整数并输出其中的最大值和所有整数之和。
>
> 3）编写函数，模拟内置函数 sorted()。
>
> 4）用字典建立一个通讯录，向字典中添加和删除通讯人（名字、电话、邮箱、工作单位等），查询某个人的信息，然后输出通讯录中所有人的信息。
>
> 5）用生成器的方式计算任意起止范围内质数的和。质数，又称素数，是大于 1 的自然数，除了 1 和它本身外，不能被其他自然数整除。



## 1）编写函数，接收一个字符串，分别统计大写字母、小写字母、数字、其他字符的个数，并以元组的形式返回结果。

```python
def numberOfType(a: str):
    intcount    = []
    upstrcount  = []
    lowstrcount = []
    othercount  = []
    for i in a:
        if i.isdigit():
            intcount.append(i)
        elif i.isupper():
            upstrcount.append(i)
        elif i.islower():
            lowstrcount.append(i)
        else:
            othercount.append(i)
    return intcount, upstrcount, lowstrcount, othercount

if __name__ == '__main__':
    a, b, c, d = numberOfType(input('请输入一个字符串：'))
    print('大写字母的个数：{}'.format(len(a)))
    print('小写字母的个数：{}'.format(len(b)))
    print('数字的个数：{}'.format(len(c)))
    print('其他数字的个数：{}'.format(len(d)))
    print(tuple(a), tuple(b), tuple(c), tuple(d))
```



## 2）编写函数，可以接收任意多个整数并输出其中的最大值和所有整数之和。

```python
def max_sum(num_list: list):
    return sum(num_list), max(num_list)


if __name__ == '__main__':
    sum_num, max_num = max_sum(list(map(int, input('请输入一些整数以逗号隔开：').split(","))))
    print('最大的整数是：', max_num)
    print('所有整数之和是：', sum_num)
```



## 3）编写函数，模拟内置函数 sorted()。

```python
# timSort
''''
timSort 是 python、Java 等语言的内置排序函数。timSort 将插入排序和归并排序结合，首先将
原始无须列表分割成一个个 run,run 是将原始无需序列按照对应关系分割而成，一般这里的 run
制的是原始序列里面存在的有序序列。任何无序序列可以被分割成有序序列的集合。
说明：这里仅仅实现了 timsort 的雏形，没有考虑 minrun。
'''

import random
import time


def binary_search(the_array, item, start, end):  # 二分法插入排序
    if start == end:
        if the_array[start] > item:
            return start
        else:
            return start + 1
    if start > end:
        return start

    mid = round((start + end) / 2)

    if the_array[mid] < item:
        return binary_search(the_array, item, mid + 1, end)

    elif the_array[mid] > item:
        return binary_search(the_array, item, start, mid - 1)

    else:
        return mid


def insertion_sort(the_array):
    l = len(the_array)
    for index in range(1, l):
        value = the_array[index]
        pos = binary_search(the_array, value, 0, index - 1)
        the_array = the_array[:pos] + [value] + \
            the_array[pos:index] + the_array[index+1:]
    return the_array


def merge(left, right):  # 归并排序
    if not left:
        return right
    if not right:
        return left
    if left[0] < right[0]:
        return [left[0]] + merge(left[1:], right)
    return [right[0]] + merge(left, right[1:])


def timSort(the_array):
    runs, sorted_runs = [], []
    length = len(the_array)
    new_run = []

    for i in range(1, length):  # 将序列分割成多个有序的 run
        if i == length - 1:
            new_run.append(the_array[i])
            runs.append(new_run)
            break
        if the_array[i] < the_array[i-1]:
            if not new_run:
                runs.append([the_array[i-1]])
                new_run.append(the_array[i])
            else:
                runs.append(new_run)
                new_run = []
        else:
            new_run.append(the_array[i])

    for item in runs:
        sorted_runs.append(insertion_sort(item))

    sorted_array = []
    for run in sorted_runs:
        sorted_array = merge(sorted_array, run)

    # print(sorted_array)


arr = [random.random() for _ in range(1000)]
# arr = [45,2.1,3,67,21,90,20,13,45,23,12,34,56,78,90,0,1,2,3,1,2,9,7,8,4,6]
t0 = time.perf_counter()
timSort(arr)
t1 = time.perf_counter()
print('共%.5f 秒' % (t1-t0))

t0 = time.perf_counter()
sorted(arr)
t1 = time.perf_counter()
print('共%.5f 秒' % (t1-t0))
```



输出：

`共0.43574秒`
`共0.00009秒`

参考：[TimSort（简易版）和堆排序的 Python 实现_Leahy000 的博客-CSDN 博客](https://blog.csdn.net/weixin_41954254/article/details/84573341)

## 4）用字典建立一个通讯录，向字典中添加和删除通讯人（名字、电话、邮箱、工作单位等），查询某个人的信息，然后输出通讯录中所有人的信息。

```python
def add():
    # 添加通讯人
    name, tel, email, add = input('请输入您要添加的通讯人信息，以空格分开：').split()
    contacts.append({'姓名': name, '电话': tel, '电子邮箱': email, '地址': add})

def lookfor(name):
    # 索引到通讯人所在的字典
    for d in contacts:
        if d['姓名'] == name:
            return d

def delect():
    # 删除通讯人
    name = input('请输入要删除人的姓名：')
    d = lookfor(name)
    if(d == None):
        print('查无此人')
    else:
        contacts.remove(d)

def inquire():
    # 查询某个人的信息
    name = input('请输入需要查询的人的姓名：')
    d = lookfor(name)
    if(d == None):
        print('查无此人')
    else: 
        print(lookfor(name))


def outputall():
    # 输出所有人的信息
    for d in contacts:
        print(d)

contacts = []
if __name__ == '__main__':
    while(1):
        try:
            print('请输入您所需要的功能\n1：添加通讯人 2:删除通讯人 3：查询通讯人 4：输出所有人信息 5：退出')
            cmd = input()
            if cmd == '1':
                add()
            elif cmd == '2':
                delect()
            elif cmd == '3':
                inquire()
            elif cmd == '4':
                outputall()
            elif cmd == '5':
                break
            else:
                print('输入错误')
        except:
            print('发生错误')
            continue
```



## 5）用生成器的方式计算任意起止范围内质数的和。质数，又称素数，是大于 1 的自然数，除了 1 和它本身外，不能被其他自然数整除。

```python
def myprime(x):
    if x <= 1:
        return False
    if 0 in [x%d for d in range(2,int(x**0.5)+1)]:
        return False
    return True


def myprimes(start, end):
    for i in range(start, end+1):
        if myprime(i):
            yield i


a = int(input('起：'))
b = int(input('止：'))
print([x for x in myprimes(a, b)])
```







# 【Python】第四次上机报告

> 基本内容包括：
>
> 1）编写代码，实现一个栈（Stack）的类。栈是只能在一端插入和删除数据的序列。它按照先进后出的原则存储数据，先进入的数据被压入栈底，最后的数据在栈顶，需要读数据的时候从栈顶开始弹出数据（最后一个数据被第一个读出来）。
>
> 2）编写代码，定义一个形状基类，有 2 个属性：面积和周长，以及两个无返回值的方法：area() 和 perimeter()，分别计算形状的面积和周长，从基类派生出三个子类：三角形、矩形、圆，重载基类的两个方法。



## 实现一个栈（Stack）的类

编写代码，实现一个栈（Stack）的类。栈是只能在一端插入和删除数据的序列。它按照先进后出的原则存储数据，先进入的数据被压入栈底，最后的数据在栈顶，需要读数据的时候从栈顶开始弹出数据（最后一个数据被第一个读出来）。



```python
class Stack(object):
    def __init__(self):
        # 创建一个空的栈
        self.item = []

    def push(self,item):
        # 添加新元素到栈顶
        self.item.append(item)

    def pop(self):
        # 弹出栈顶元素
        return self.item.pop()

    def peek(self):
        # 返回栈顶元素
        return self.item[self.size()-1]

    def is_empty(self):
        # 检验是否为空
        return self.item == []

    def size(self):
        # 返回栈的个数
        return len(self.item)
```



## 形状的类

编写代码，定义一个形状基类，有 2 个属性：面积和周长，以及两个无返回值的方法：`area()`和 `perimeter()`，分别计算形状的面积和周长，从基类派生出三个子类：三角形、矩形、圆，重载基类的两个方法

```python
# 编写代码，定义一个形状基类，
# 有 2 个属性：
#   面积和周长，
# 以及两个无返回值的方法：
#   area() 和 perimeter()，分别计算形状的面积和周长
#
# 从基类派生出三个子类：三角形、矩形、圆，
#   重载基类的两个方法

class 形状基类:
    def __init__(self, 名字, 面积, 周长):
        self.名字 = 名字
        self.面积 = 面积
        self.周长 = 周长

    def area(self):
        pass

    def perimeter(self):
        pass

    def 解释(self):
        self.area()
        self.perimeter()
        print('名称：', self.名字, '面积：', self.面积, '周长：', self.周长)


class 矩形(形状基类):
    def __init__(self, n, a, b):
        self.名字 = n
        self.a = a
        self.b = b

    def area(self):
        self.面积 = round(self.a * self.b, 2)

    def perimeter(self,):
        self.周长 = round(2*(self.a+self.b), 2)


class 三角形(形状基类):
    def __init__(self, n, a, b, c):
        self.名字 = n
        self.a = a
        self.b = b
        self.c = c

    def area(self):
        p = (self.a+self.b+self.c)/2
        self.面积 = round((p*(p-self.a)*(p-self.b)*(p-self.c))**0.5, 2)

    def perimeter(self):
        self.周长 = self.a+self.b+self.c


class 圆(形状基类):
    def __init__(self, n, a):
        self.名字 = n
        self.a = a

    def perimeter(self):
        self.周长 = round(2*3.14*self.a, 2)

    def area(self):
        self.面积 = round(3.14*self.a**2, 2)


if __name__ == '__main__':
    圆('圆形',1).解释()
    三角形('三角形',2,3,3).解释()
    矩形('矩形',6,42).解释()
    
```


参考：[中文代码快速补全 VS Code 插件尝鲜 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/138708196)
