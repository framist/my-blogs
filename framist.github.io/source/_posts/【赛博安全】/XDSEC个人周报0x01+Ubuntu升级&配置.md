---
title: XDSEC 个人周报 0x01+Ubuntu 升级&配置
categories:
  - 计算机科学
  - 网络安全
  - 个人周报
tags:
  - 信息安全
  - 周报
abbrlink: 20804
date: 2020-11-29
---

# XDSEC 个人周报 0x01+Ubuntu 升级&配置



## 系统环境搭建

重新启用以前安装的 Ubuntu 双系统。由于是 16.04LTS 版本，并被我乱装插件搞得满是 bug，而且好长时间没有使用过了，我准备先把它升级到 20.04，并清理清理能让它正常使用。

### Ubuntu16.04>Ubuntu18.04>Ubuntu20.04

并不能直接一步升级到位，于是分两步升级。

<!--more-->

1.更新资源

```bash
$ sudo apt-get update

$ sudo apt-get upgrade

$ sudo apt dist-upgrade
```

这里会出现一些软件下载失败，（比如 Vs Code），手动更新即可。

2.安装 update-manager-core

```bash
$ sudo apt-get install  update-manager-core
```

3.更新 16.04 到 18.04

```bash
$ sudo do-release-upgrade
```

执行上一步命令后，会自动升级系统。

4.清理无用的安装包

```bash
$ sudo apt-get remove
```

5.更新 18.04 到 20.04 同理



*升级时无需考虑是否会影响 GRUB 启动项与本机的另一个系统 Windows10，我这里尝试未出现问题*



### 解决开机后卡死

可能是是 NVIDIA 驱动跟 gdm3 桌面打架的原因。



参考[这个](https://blog.csdn.net/weixin_40851278/article/details/82701410)进入系统

> **1、开机，在选择系统时，光标选中 Ubuntu 然后按下键盘的 E 键进入编辑模式，选择对 Ubuntu 进行编辑，
> 找到“quiet splash”，在本段的最后面加上“acpi_osi=Linux nomodeset”，接着按 F10 保存并启动，
> 就可以进入到我们的 Ubuntu 了。**

用

```bash
$ nvidia-smi
```

确认正常安装 NVIDIA 驱动

接着参考：

https://www.zhihu.com/question/391013741/answer/1189243909

```bash
$ sudo apt install lightdm
$ sudo dpkg-reconfigure lightdm
$ sudo service lightdm restart
```

用`nvidia-setting`可以配置同时使用核显和独显，与 Windows 上使用逻辑相同。



### 解决系统 UI 卡顿



周期性卡顿，推测是系统负载提示器的刷新导致，卸载之~

[参考](https://blog.csdn.net/qq_43334196/article/details/107374390)

### 解决没有中文输入法

在设置里瞎点一通，也安装了以下输入法，没有成功。

```shell
sudo apt install ibus-libpinyin 
sudo apt install ibus-clutter
```

后来无意间`ctrl`+`space`竟然唤出来以前安装的搜狗输入法。



### 解决声音输出为“伪输出”，不能发声

参考[这个](https://blog.csdn.net/qq_45805535/article/details/108416417)解决

*注：之前尝试过`sudo usermod -a -G audio $USER`，不知原理，没有撤销*



### tty 界面优化、解决没有中文显示的问题：

https://blog.csdn.net/xiajian2010/article/details/9625131

安装`fbterm`

在 tty 中使用`sudo fbterm`再切换回自己的用户

修改配置文件：

```bash
sudo vim /root/.fbtermrc
```

### 解决双系统时间不一致


 `$sudo timedatectl set-local-rtc 1`

之后手动在设置里关闭再打开“自动更新时间”，已保证时间正确

参考：

https://blog.csdn.net/bruceoxl/article/details/79151640

### 杂项

* 安装`screenfetch`

```
                          ./+o+-       *****@***************
                  yyyyy- -yyyyyy+      OS: Ubuntu 20.04 focal
               ://+//////-yyyyyyo      Kernel: x86_64 Linux 5.4.0-54-generic
           .++ .:/++++++/-.+sss/`      Uptime: 11m
         .:++o:  /++++++++/:--:/-      Packages: 2707
        o:+o+:++.`..```.-/oo+++++/     Shell: zsh 5.8
       .:+o:+o/.          `+sssoo+/    Resolution: 1920x1080
  .++/+:+oo+o:`             /sssooo.   DE: GNOME 3.36.4
 /+++//+:`oo+o               /::--:.   WM: Mutter
 \+/+o+++`o++o               ++////.   WM Theme: 
  .++.o+++oo+:`             /dddhhh.   GTK Theme: Numix [GTK2/3]
       .+.o+oo:.          `oddhhhh+    Icon Theme: Ultra-Flat
        \+.++o+o``-````.:ohdhhhhh+     Font: Ubuntu 11
         `:o+++ `ohhhhhhhhyo++os:      Disk: 740G / 1.2T (65%)
           .o:`.syhhhhhhh/.oo++o`      CPU: Intel Core i5-9300H @ 8x 4.1GHz [56.0°C]
               /osyyyyyyo++ooo+++/     GPU: GeForce GTX 1050
                   ````` +oo+++o\:     RAM: 3085MiB / 15794MiB
                          `oo++.
```

* 安装steam

```bash
$ sudo apt install steam
$ steam
```



* 安装Minecraft
* 科学上网

https://blog.csdn.net/qq_22644927/article/details/106991213

* 美化桌面

https://linux.cn/article-9447-1.html

* 安装VCL视频播放器

```bash
sudo apt install vlc
```





## 搭建Web应用的运行环境（PHP+MySQL）

参考@[Dnull](https://bbs.xdsec.org/u/Dnull)的方法：

> **搭建web应用运行环境**
>
> 下载apach2
>  参考：https://blog.csdn.net/qq_16166591/article/details/93797976
>
> 下载mysql
>  参考：[https://zazalu.space/2019/06/14/ubuntu18-04%E5%AE%89%E8%A3%85mysql8-0-16-Community/](https://zazalu.space/2019/06/14/ubuntu18-04安装mysql8-0-16-Community/)



<pre><span style="background-color:#CD00CD"><font color="#E5E5E5">软件包设置</font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">┌───────────────────────┤ </font></span><span style="background-color:#E5E5E5"><font color="#CD0000">正在设定 mysql-apt-config</font></span><span style="background-color:#E5E5E5"><font color="#000000"> ├───────────────────────┐</font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ MySQL APT Repo features MySQL Server along with a variety of MySQL        │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ components. You may select the appropriate product to choose the version  │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ that you wish to receive.                                                 │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                                                           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ Once you are satisfied with the configuration then select last option     │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ &apos;Ok&apos; to save the configuration, then run &apos;apt-get update&apos; to load         │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ package list. Advanced users can always change the configurations later,  │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ depending on their own needs.                                             │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                                                           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│ Which MySQL product do you wish to configure?                             │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                                                           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│          MySQL Server &amp; Cluster (Currently selected: mysql-8.0)           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│          MySQL Tools &amp; Connectors (Currently selected: Enabled)           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│          MySQL Preview Packages (Currently selected: Disabled)            │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│          </font></span><span style="background-color:#CD0000"><font color="#E5E5E5">Ok                                                     </font></span><span style="background-color:#E5E5E5"><font color="#000000">          │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                                                           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                                                           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                  &lt;确定&gt;                                   │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">│                                                                           │</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF"> </font></span><span style="background-color:#E5E5E5"><font color="#000000">└───────────────────────────────────────────────────────────────────────────┘</font></span><span style="background-color:#000000"><font color="#FFFFFF"> </font></span>
<span style="background-color:#CD00CD"><font color="#FFFFFF">  </font></span><span style="background-color:#000000"><font color="#FFFFFF">                                                                             </font></span>


</pre>

> 下载php7.4
>  参考：https://www.cnblogs.com/impy/p/8040684.html

```bash
sudo apt-get install php7.4
```



> 5.创建test.php，访问localhost/test.php

写入

```php
<?php
phpinfo();
?>
```

使用MySQL：

```bash
mysql -u root -p
Enter password: 
```

整合php与mysql

```
sudo apt-get install php7.0-mysql
```

重启apache和mysql服务

```
sudo service apache2 restart
sudo service mysql restart
```

## 了解SQL注入漏洞



## 在上面搭建的环境中运行SQL-labs

[参考](https://www.cnblogs.com/lcamry/p/5763162.html)

https://www.cnblogs.com/skyhive/p/6400989.html

Sqli-labs项目地址---Github获取：https://github.com/Audi-1/sqli-labs

**Sqli-labs安装** 

> Install Instructions:
>
> 1. Unzip the contents inside the apache folder, for example under /var/www
> 2. This will create a folder sql-labs under it. else you can use git command from within /var/www folder. /var/www folder and then use following command> git clone https://github.com/Audi-1/sqli-labs.git sqli-labs
> 3. Open the file "db-creds.inc" which is under sql-connections folder inside the sql-labs folder.
> 4. Update your MYSQL database username and password.(default for Backtrack are used root:toor)
> 5. From your browser access the sql-labs folder to load index.html
> 6. Click on the link setup/resetDB to create database, create tables and populate Data.
> 7. Labs ready to be used, click on lesson number to open the lesson page.
> 8. Enjoy the labs

```bash
cd /var/www/html
git clone https://github.com/Audi-1/sqli-labs.git sqli-labs
```







修改sql-connections/db-creds.inc文件当中的mysql账号密码

将user和pass修改你的mysql 的账号和密码

访问`http://localhost/sqli-labs/`的页面，点击





![img](https://images2015.cnblogs.com/blog/669054/201608/669054-20160811231402125-1775048606.png)



进行安装数据库的创建



卡在下面这一步了

<div style=" margin-top:20px;color:#FFF; font-size:24px; text-align:center"> 
Welcome&nbsp;&nbsp;&nbsp;
<font color="#FF0000"> Dhakkan </font>
<br>
</div>

<div style=" margin-top:10px;color:#FFF; font-size:23px; text-align:left">
<font size="3" color="#FFFF00">
SETTING UP THE DATABASE SCHEMA AND POPULATING DATA IN TABLES:
<br><br> 


![Screenshot_2020-12-13 SETUP DB](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815211039.png)



~~至此，安装结束。我们就可以开始游戏了~~。

## 服务器建站

使用阿里云服务器建站（framispark.cn）

```bash
$ ssh root@framispark.cn

Welcome to Alibaba Cloud Elastic Compute Service !

[root@izuf67jdvnw88ct8qh20iwz ~]#
[root@izuf67jdvnw88ct8qh20iwz ~]# lynx localhost
```

建站之后能通过localhosh访问网站，但从其他地方访问怎么也不成功，

能ping通，防火墙80端口也是允许访问的

```bash
$ ping framispark.cn

正在 Ping framispark.cn [101.132.194.56] 具有 32 字节的数据：
来自 101.132.194.56 的回复：字节=32 时间=35ms TTL=48
来自 101.132.194.56 的回复：字节=32 时间=41ms TTL=48
来自 101.132.194.56 的回复：字节=32 时间=35ms TTL=48
来自 101.132.194.56 的回复：字节=32 时间=33ms TTL=48

101.132.194.56 的 Ping 统计信息：
    数据包：已发送 = 4，已接收 = 4，丢失 = 0 (0% 丢失)，
往返行程的估计时间 (以毫秒为单位):
    最短 = 33ms，最长 = 41ms，平均 = 36ms
```

试了好几种建站方式，包括直接使用阿里云的WordPress模板整合系统，也不能访问，只能localhosh访问。

```bash
[root@izuf67jdvnw88ct8qh20iwz ~]# lynx localhost
```



![image-20201203162730743](https://bbs.xdsec.org/assets/files/2020-12-03/1606984383-579198-image-20201203162730743.png)





这个服务器已购买了半年了，至今还不知道什么原因。***有望大神相助 QAQ***



## 使用 docker

TODO







