---
title: XDSEC 个人周报 0x09 + Web 开发 & CodiMD\
categories:
  - 计算机科学
  - 网络安全
  - 个人周报
tags:
  - 信息安全
  - 周报
abbrlink: 47834
date: 2021-04-13
---


# XDSEC 个人周报 0x09+Web 开发&CodiMD

2021-4-12 ~ 2021-4-25

2021 春季学期第七、八周

- [XDSEC 个人周报 0x09+Web 开发\&CodiMD](#xdsec-个人周报-0x09web-开发codimd)
- [Web 开发](#web-开发)
  - [树莓派架构“全平台”极简“AI”](#树莓派架构全平台极简ai)
    - [后端](#后端)
      - [Remote-SSH](#remote-ssh)
      - [flask](#flask)
      - [安全性](#安全性)
    - [前端](#前端)
    - [内网穿透服务器](#内网穿透服务器)
    - [客户端](#客户端)
    - [运维](#运维)
      - [解决历史遗留问题](#解决历史遗留问题)
  - [配置 CodiMD\&HTTPS](#配置-codimdhttps)
    - [配置 CodiMD](#配置-codimd)
    - [使用 HTTPS](#使用-https)
    - [优化访问速度](#优化访问速度)
    - [引入第三方登录支持](#引入第三方登录支持)
- [其他内容](#其他内容)

<!--more-->

# Web 开发

***历史遗留文档，更新参见 [建站实验：framist.top | Framist's Little House](https://framist.github.io/2022/01/26/建站实验/)***

## 树莓派架构“全平台”极简“AI”

> ## 开发组 0x00“全平台”计算器
>
> https://bbs.xdsec.org/d/712-0x00
>
> ## 我们要做什么
>
> 一个拥有前端，后端与客户端的简易计算器实现。
>
> ## 怎么做
>
> ### 后端
>
> 用你顺手的后端框架做一个简易的 api 服务，接收 HTTP 请求，请求里包含两个参数，把他们相加起来然后返回结果，下图是一个使用 Go 语言的简易实现：
> ![img](https://bbs.xdsec.org/assets/files/2021-04-13/1618302950-685600-9cf2f92c-cb5e-4522-96f9-782e5cd31410.png)
> 你可以尝试用各种有趣的后端框架去搭这个。
> 附加：尝试加入各种错误修正，例如用户请求了非数字字符，那么返回一个 403 让他爬。
>
> ### 前端
>
> 编写一个不那么丑的前端页面，能够获取用户输入的两个数字，然后使用 ajax 请求上面搭好的后端，获取结果并显示出来。
> 附加：尝试从前端限制用户的输入，让其无法输入除了数字之外的字符。
>
> ### 客户端
>
> 尝试写一个命令行程序去获取用户输入，然后从服务器请求计算结果。
> 附加：尝试写一个图形化程序去做到这些。
>
> ### 运维
>
> 使用 nginx 将后端与前端部署到服务器（云服务器 or 本地虚拟机）上，要求访问 localhost/api/add 时可以调用后端，而直接访问 localhost 时可以直接获取前端页面资源。
>
> ## more…
>
> Q: 一定要写一个计算器嘛？
> A: 不一定，如果你没有自己的计划的话，计算器可能是一个最简单的实践。如果你有其他想法，例如和 QQ 机器人集成，或者做一些其他的功能都可以。
> Q: 一个人完成？
> A: 你可以选择你喜欢的部分去做。几个人分工合作搭起来这一套服务也是可以的。
>
> ——[Reverier](https://bbs.xdsec.org/u/Reverier)



### 后端

计划采用`flask`实现，部署在树莓派上。

开发工具为 VSCode & Remote-SSH 

> why? 因为 Recu3e 在 web 组会里有些示例是用 flask 实现的，~~看起来比较简单~~
>
> ~~树莓派正好白嫖空间院的，也可模拟服务器的 7*24 运行~~不用树莓派了 QAQ，电源线已经被碰掉好几次了



#### Remote-SSH

路由器设置树莓派固定内网 IP，开发 SSH 端口

Remote-SSH 配置路径不能包含中文

#### flask

文档：https://dormousehole.readthedocs.io/en/latest/

*Ps.为什么 url 里有/en/却是中文的...*



> **创建一个虚拟环境**
>
> 创建一个项目文件夹，然后创建一个虚拟环境。创建完成后项目文件夹中会有一个 `venv` 文件夹：
>
> ```bash
> $ mkdir myproject
> $ cd myproject
> $ python3 -m venv venv
> ```
> Python 3 内置了用于创建虚拟环境的 venv 模块
>
> **激活虚拟环境**
>
> 在开始工作前，先要激活相应的虚拟环境：
>
> ```bash
> $ . venv/bin/activate
> ```
>
> 激活后，你的终端提示符会显示虚拟环境的名称。
>
> **安装 Flask**
>
> 在已激活的虚拟环境中可以使用如下命令安装 Flask：
>
> ```
> $ pip install Flask
> ```



环境变量`FLASK_ENV`说明：

```bash
$ export FLASK_ENV=development # 调试模式 绝对不能在生产环境中使用调试器
$ export FLASK_ENV=production # 生产模式
```

用 flask 命令的方式建立服务：

```bash
$ export FLASK_APP=hello.py
$ flask run
$ flask run --host=0.0.0.0 # 可以让服务器被公开访问
```



> 递归式学习：[python 函数装饰器](https://www.runoob.com/w3cnote/python-func-decorators.html)



#### 安全性

使用 docker

未完待续……

### 前端

[Jinja2](http://jinja.pocoo.org/) 模板引擎

### 内网穿透服务器

~~使用 Proxyer~~（因为不支持 arm64、用了 qemu 仍出现未能解决的问题、并且貌似不开源）

使用`frp`

小坑：树莓派是 arm64 架构，有些软件不支持，qemu 也只能解决部分问题：

> mark:还未尝试[树莓派 4B 使用 Raspbian 官方 64 位系统内核](https://www.mmuaa.com/post/0c9188ffde4e2cff.html)

参考：https://developer.aliyun.com/article/749877

大坑 1：阿里云**轻量应用服务器**没有安全组规则

大坑 2：同一端口也必须用`/`分割

![image-20210414194218947](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210748.png)

> Tips：`netstat -ntlp`查看端口使用情况

### 客户端

未完待续……

### 运维

未完待续……



#### 解决历史遗留问题

批量 gb2312 转 utf-8：

> [天上的因幡](https://bbs.xdsec.org/u/天上的因幡)：
>
> iconv 可以转换文件的编码。使用 bash 的 for 循环可以批量完成。这也是为什么很多 Linux console tool 都不提供批量的原因。
>
> 也可以用 Python 的 os.system 来完成，我以前经常这么搞 (还能在 walk dir 的时候进行筛选)

> 递归式学习：python os.walk 等

---

## 配置 CodiMD&HTTPS

> 尝试使用 docker 将这个东西：[CodiMD](https://github.com/hackmdio/codimd) 部署到你的服务器上。
> 部署好了长这样：
> ![img](https://bbs.xdsec.org/assets/files/2021-04-16/1618566972-577071-7b110100-162e-4731-b540-9baf0a72b5e4.png)
> 可以很方便的进行多人实时协作。
> 附加：使用 HTTPS
> 附加加：使用你所能想到的各种手段优化访问速度。
> 附加加加：引入第三方登录支持，例如 GitHub 登录等。
>
> 示例：[md.woooo.tech](https://md.woooo.tech/)

### 配置 CodiMD

*考虑到之前使用树莓派时遇到的一些问题（比如 arm 架构、内网环境干扰多），还是准备把 CodiMD 服务配置到阿里云服务器上*

参考[官方说明文档：Docker Deployment](https://hackmd.io/c/codimd-documentation/%2Fs%2Fcodimd-docker-deployment)进行配置

之后访问 http://framispark.cn:3000/ 可以看到 CodiMD 界面。



注意：CodiMD 的注册界面跟登陆界面是同一个界面



> Tips：`nload`查看服务器网络情况

QAQ 太慢了。。。怪不得后面有任务是[优化访问速度](#优化访问速度)



> 递归式学习：[YAML](https://www.runoob.com/w3cnote/yaml-intro.html)
>
> > YAML 是 "YAML Ain't a Markup Language"（YAML 不是一种标记语言）的递归缩写。在开发的这种语言时，YAML 的意思其实是："Yet Another Markup Language"（仍是一种标记语言）。

### 使用 HTTPS

可以非常方便地使用 [![Let's Encrypt](https://letsencrypt.org/images/letsencrypt-logo-horizontal.svg)](https://letsencrypt.org/zh-cn/) 实现

### 优化访问速度

### 引入第三方登录支持

参考[官方文档：Authenticate Using OAuth - GitHub](https://hackmd.io/s/codimd-oauth-github)

![image-20210417234511925](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210748-1.png)



添加`Client ID`和`Client Secret`到环境变量：

```yaml
  codimd:
    environment:
      - CMD_GITHUB_CLIENTID=*******************************
      - CMD_GITHUB_CLIENTSECRET=***********************************
```

重启 docker-compose

然后就可以看到了：

![image-20210418001456482](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210748-2.png)

---

# 其他内容

**其他学习内容**

* ~~学习~~了一点区块链知识
  * 玩了一下 chia 农场
    * [树莓派上安装 chia](https://github.com/Chia-Network/chia-blockchain/wiki/Raspberry-Pi)

**一些计划**

* 剪枝
* 回顾
  * 重新修订了以前的一些 blog，并用[`VSCode on zhihu`](https://zhuanlan.zhihu.com/p/106057556)讲一些 blog 推到了知乎