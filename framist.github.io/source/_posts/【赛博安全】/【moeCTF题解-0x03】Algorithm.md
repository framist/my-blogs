---
title: 【moeCTF题解-0x03】Algorithm
categories: 
- 计算机科学
- 网络安全
- CTF
- moeCTF
tags: 
- CTF
---

# 【moeCTF题解-0x03】Algorithm

***计算是宇宙的本质***

*（并不）*

<br/>

这部分主要是一些数据处理题和算法题。

数据处理题用`Python`做较为容易。 

算法题要求用`C++`，我不太擅长；又因都是一些经典的题目，万维网上其他大佬的题解很多，故没有去做，这个题解中会放一些其他人题解的链接。

<!--more-->

<br/>

> **【moeCTF题解】总目录如下：**
>
> * [【moeCTF题解-0x00】序				（包括Sign in）](https://framist.github.io/2020/10/09/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x00%E3%80%91%E5%BA%8F/)
>
> * [【moeCTF题解-0x01】Reverse      （包括Android、IoT）](https://framist.github.io/2020/10/09/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x01%E3%80%91Reverse/)
> * [【moeCTF题解-0x02】Pwn](https://framist.github.io/2020/10/09/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x02%E3%80%91Pwn/)
> * [【moeCTF题解-0x03】Algorithm](https://framist.github.io/2020/10/12/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x03%E3%80%91Algorithm/)
> * [【moeCTF题解-0x04】Crypto          （包括 Classic Crypto）](https://framist.github.io/2020/10/12/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x04%E3%80%91Crypto/)
> * [【moeCTF题解-0x05】Misc](https://framist.github.io/2020/10/15/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x05%E3%80%91Misc/)
> * [【moeCTF题解-0x06】Web](https://framist.github.io/2020/10/25/%E3%80%90moeCTF%E9%A2%98%E8%A7%A3-0x06%E3%80%91Web/)

<br/>


# 数据处理

4/4

## mess

> 50points
>
> what a mess!
>
> flag请准确提交.
>
> 本题请锻炼自己的编程能力, 当然工具人解法也可以拿到`flag`.

题目所给附件的内容如下：

* `puzzle.txt`

```
1091111A01ruVJl99hw11Qv6i102xCYC1c2B31DIsz1tm212l11A1l610448re11BQ09549115951n154V895F115d49109h1m1210810j11w2A5
```

* `puzzle.py`

```python
import random
flag = 'moectf{xxxxxxxxxxx}'

digit = ''

for i in flag:
    digit += str(ord(i))

i = 0
while i < len(digit):
    n = random.randint(0, 128)
    if ord('a') <= n <= ord('z') or ord('A') <= n <= ord('Z'):
        digit = digit[0:i] + chr(n) + digit[i:]
    i += 1

with open('puzzle.txt', 'w') as out:
    out.write(digit)

```

显而易得解码脚本：

```python
import random
# 解码
outflag = '1091111A01ruVJl99hw11Qv6i102xCYC1c2B31DIsz1tm212l11A1l610448re11BQ09549115951n154V895F115d49109h1m1210810j11w2A5'
d = ''
for i in outflag:
    if i.isnumeric():
        d = d + i
print(d)
# 手撕部分，这里当时觉得手撕比较快就手撕了，得dl
dd = ''
dl = [109, 111, 101 ,99 ,116, 102 ,123, 112 ,121 ,116 ,104 ,48, 110, 95 ,49 ,115, 95, 115 ,48 ,95 ,115 ,49 ,109 ,112, 108 ,101 ,125]
for i in dl:
    dd = dd + chr(i)
print(dd)
```

运行得到flag：`moectf{pyth0n_1s_s0_s1mple}`



<br/>

## [Frank](https://blog.frankli.site/), 永远滴神

> 100points
>
> 数 据 统 计, 在题目的压缩包中有一些文件, 请统计所有文件中`FrankNB!`字符串出现了多少次, 统计得到的数字使用`base64`编码后包裹上`moectf{}`提交.
>
> 例如: 我统计结果为`6324`, 那么`flag`为: `moectf{NjMyNA==}`
>
> 如果你的答案一直不正确, 请联系管理员, 不要多次提交爆破`flag`.
>
> 
>注:本题如果使用工具解出的话, 你下一题写起来会比较困难哦~

题目所附的出题脚本如下：

```python
import sys
import os
import random
import uuid
key = 'FrankNB!'
os.makedirs('./puzzle')


for i in range(10):
    fold1 = str(uuid.uuid4())[:8]
    os.makedirs('./puzzle/'+fold1)
    for j in range(10):
        fold2 = str(uuid.uuid4())[:8]
        os.makedirs('./puzzle/'+fold1 + '/'+fold2)
        for k in range(10):
            fold3 = str(uuid.uuid4())[:8]
            os.makedirs('./puzzle/'+fold1 + '/'+fold2 + '/'+fold3)
            out = ''
            for i in range(1000):
                ch = random.randint(0, 127)
                if ord('a') <=ch<=ord('z') or ord('A') <=ch<=ord('Z') or ord('0') <= ch <=ord('9'):
                    out+=chr(ch)
                else:
                    if random.randint(0, 100) < 40:
                        out+=key
            with open('./puzzle/'+fold1 + '/'+fold2 + '/'+fold3 + '/'+fold3+'.txt', 'w') as aim:
                aim.write(out)
```

比较直接的题，直接给解题脚本了：

```python
import os
SUM = 0
def Search(rootDir, suffixes, arg):   
    for lists in os.listdir(rootDir):       
        path = os.path.join(rootDir, lists)
        if os.path.isfile(path):
            if path.endswith(suffixes):
                try:
                    with open(path,mode='r') as fh:
                        line = fh.read()
                        global SUM
                        SUM += line.count(arg)
                        fh.close()
                except:
                    print('error: ', path)
        if os.path.isdir(path):
            Search(path, suffixes, arg)

Search('./puzzle', '.txt', 'FrankNB!')
print(SUM)
print(b'moectf{' + base64.b64encode(bytes(str(SUM),encoding='utf-8')) + b'}')
```

运行后`SUM = 205232`

得到flag：`moectf{MjA1MjMy}`

<br/>

---

## [赤道企鹅](https://eqqie.cn/), 永远滴神

> 200points
>
> 题目的压缩包中有一些文件, 每个文件均以`EqqieNB`开头, 请你统计一下由`EqqieNB!`开头, 而不是以`EqqieNB?`开头的文件中, 连续字母数字的子符串一共有多少个, 开头的`EqqieNB`不计入总数.
>
> 例如: 文件内容为
>
> ```
> EqqieNB!Dp6```!]PJa4xaLzgC5TDzf'Ze@FF'WH&J6{QnoBpBzV&j?Q;hs22So*y)Ses&MOuB7*8]3*4[0'en
> ```
>
> 那么符合要求的字符串有:
>
> ```
> ['Dp6', 'PJa4xaLzgC5TDzf', 'Ze', 'FF', 'WH', 'J6', 'QnoBpBzV', 'j', 'Q', 'hs22So', 'y', 'Ses', 'MOuB7', '8', '3', '4', '0', 'en']
> ```
>
> 一共18个. 如果文件开头为`EqqieNB?`, 那么忽略文件中所有内容, 继续处理其他文件.
>
> 请统计所有文件中符合要求的字符串个数, 总数使用`Base64`编码后, 包裹上`moectf{}`进行提交. 例如我的统计结果为`6324`, 那么`flag`为: `moectf{NjMyNA==}`
>
> 如果提交多次答案都不正确, 请检查你的算法是否正确, 请勿爆破`flag`. 如果实在感觉题目有问题, 请戳管理员. `flag`提交次数限制为15次, 且每分钟只能提交5次.



题目所附的出题脚本如下：

```python
import sys
import os
import random
import uuid
key = 'EqqieNB'
os.makedirs('./puzzle')


for i in range(10):
    fold1 = str(uuid.uuid4())[:8]
    os.makedirs('./puzzle/'+fold1)
    for j in range(10):
        fold2 = str(uuid.uuid4())[:8]
        os.makedirs('./puzzle/'+fold1 + '/'+fold2)
        for k in range(20):
            fold3 = str(uuid.uuid4())[:8]
            os.makedirs('./puzzle/'+fold1 + '/'+fold2 + '/'+fold3)
            out = key + ('!' if random.randint(0, 100) < 40 else '?')
            for i in range(1000):
                ch = random.randint(33, 127)
                out += chr(ch)
            with open('./puzzle/'+fold1 + '/'+fold2 + '/'+fold3 + '/'+fold3+'.txt', 'w') as aim:
                aim.write(out)

```

也是比较直接的题，直接给解题脚本了：

```python
import base64
import os

SUM = 0
lines = "EqqieNB!Dp6```!]PJa4xaLzgC5TDzf'Ze@FF'WH&J6{QnoBpBzV&j?Q;hs22So*y)Ses&MOuB7*8]3*4[0'en"
f = 0
for c in lines[8:]:
    if not c.isalnum():
        f = 0
    elif f == 0:
        SUM += 1
        f = 1
print(SUM)
# 前面这一段是测试一下算法正确不正确
SUM = 0
def Search(rootDir, suffixes, arg):   
    for lists in os.listdir(rootDir):       
        path = os.path.join(rootDir, lists)
        if os.path.isfile(path):
            if path.endswith(suffixes):
                with open(path,mode='r') as fh:
                    lines = fh.read()
                    if lines[0:8] == 'EqqieNB!':
                        f = 0
                        for c in lines[8:]:
                            if not c.isalnum():
                                f = 0
                            elif f == 0:
                                global SUM
                                SUM += 1
                                f = 1
        if os.path.isdir(path):
            Search(path, suffixes, arg)

Search(r'G:\Users\胡夏南\Desktop\MoeCTF2020\Algorithm\EqqieNB\puzzle.tar\puzzle', '.txt', 'EqqieNB!')
print(SUM)
print(b'moectf{' + base64.b64encode(bytes(str(SUM),encoding='utf-8')) + b'}')
```

运行后`SUM = 182426`

得到flag：`moectf{MTgyNDI2}`

*听说要用到正则表达式，可我没有用到* :ghost:*正则表达式更方便一点叭*

<br/>

---

## 千层饼

> 300points
>
> 老千层饼了.
>
> flag请准确提交.
>
> 题目`puzzle.txt`链接: [超星云盘](http://pan-yz.chaoxing.com/share/info/01f9ea99696900b5) 提取码 : `6k0ojq`

题目所附的出题脚本如下：

```python
from base64 import *
from random import Random
from flag import flag

alg = [b16encode, b32encode, b64encode, a85encode, b85encode]

r = Random()
for i in range(r.randrange(35,40)):
    er = r.choice(alg)
    flag = r.choice(alg)(str(alg.index(er)).encode()) + b'eqqie_is_god' + er(flag)

with open('secret.txt','wb') as out:
    out.write(flag)
with open('puzzle.txt', 'wb') as out:
    out.write(flag)
```

~~也是比较直接的题，直接给解题脚本了：~~

```python
from base64 import *
from random import Random

alg = [b16encode, b32encode, b64encode, a85encode, b85encode]
gla = [b16decode, b32decode, b64decode, a85decode, b85decode]

with open(r'Algorithm\千层饼\puzzle0.txt', 'rb') as f:
    read = f.readline()
    while len(read) > 40:
        sI = read.find(b'eqqie_is_god')

        readHead = read[:sI]
        readTail = read[sI+12:]
        for i in range(5):
            er = gla[i]
            try:
                iGla = int(er(readHead))
            except:
                continue
            if not (0<=iGla<=4):
                continue
            else:
                break
        der = gla[iGla]
        print(iGla)
        read = der(readTail)
    print(read)
# moectf{so00Oo0oO_d31ici0us}
```

运行得到flag：`moectf{so00Oo0oO_d31ici0us}`

> 得要一个好电脑

<br/>

---

# 算法

1/3

以下只放一些其他人题解的链接

## 子串

> 200points
>
> 给你一个`n`与`n`**对**字母, 请构造一个长度为`(n+1)`的字符串, 使得这`n`对字母均为该字符串的子串. 注意, `n`对字母可以看成能够颠倒, 长度为`2`的字符串. 如果有多个解, 那么输出字典序最小的方案. 如果无解, 不输出. 样例输入: `4 aZ tZ Xt aX ` 样例输出: `XaZtX ` 解释: 输出的长度为`4+1=5`, 由于给定的子串可以颠倒, 所以样例输出中第三个字母和第四个字母是输入中的`dZ`. 此字符串包含输入给定的所有子串. 数据规模: 所有数据满足: n<=1000 `注: 测评语言请选用C++, 暂不支持其他语言的评测`




<br/>

---

## 曲奇饼

> 200points
>
> rx拿来一盘曲奇饼, 在桌子上排成一排, 曲奇饼各有不同的口味.
>
> 现在rx想在这一排曲奇饼中选中一段连续的曲奇饼, 使这一段中的所有曲奇口味各不相同, 请问这一段最多可以包含多少个曲奇饼?
>
> 输入示例:
>
> ```
> acwetadf
> ```
>
> 输出示例:
>
> ```
> 7
> ```
>
> 输出解释:
>
> 最长的一串为`cwetadf`
>
> 数据范围: `1 <= input.length() <= 10000000`
>
> ```
> update: 题目数据中字符范围为所有可打印ASCII字符: 32<=ord(ch)<=126
> ```
>
> ```
> 注: 仅支持C++评测.
> ```


<br/>

---

## [luoqi@n](https://luoq1an.github.io/)'s Diamond

> 500points
>
> `luoqi@n`是一个MC资深玩家, 他不管在哪个服务器都拥有着成箱成箱的钻石. 但是有一天, 他觉得自己的钻石实在是太多了, 想向村民拍卖掉一些, 换成绿宝石, 于是他就带着一背包的钻石块出发了.
>
> 到了村庄, 村民闻讯赶来. 每个村民手中都带了`9`块绿宝石, 他们排好队后从前往后依次出价. 由于前面村民出价的限制, 后出价的村民提出的价钱必须大于等于之前所有村民的出价.由于宝石实在太多了所以所有的村民都会出价.
>
> 在拍卖会上`luoqi@n`一眼看下去, 突然想到一个问题:
>
> 如果把村民从前往后出的价钱拼接起来, 拼成一个超级大的整数, 那么在所有可能出现的情况中, 这个整数能整除**另一个给定整数**`p`的情况有多少种?
>
> 由于答案可能非常的大, `luoqi@n`只希望知道结果`%999911659`就可以了.
>
> luoqi@n的算法水平并不是很好, 你能帮他计算一下这个答案嘛?
>
> * 输入描述
>
> 输入只包含两个整数`n`,`p`, `n`为参与拍卖会的村民数量, `p`为要整除的目标整数.
>
> 数据范围: `1 <= n <= 10^18, 1 <= p <= 500`
>
> * 输出描述
>
> 输出一个整数, 为能够整除`p`的情况总数`%999911659`
>
> * 示例输入
>
> ```
> 2 3
> ```
>
> * 示例输出
>
> ```
> 15
> ```
>
> * 输出解释:
>
> 符合要求的出价有`12 15 18 24 27 33 36 39 45 48 57 66 69 78 99`
>
> ```
> 注: 仅支持C++评测.
> ```

<br/>



~~连接呢？[洛谷](https://www.luogu.com.cn/)上都有的，自己找去吧~~

---

*未完待续……？*