---
title: 【moeCTF题解-0x04】Crypto
categories: 
- 计算机科学
- 网络安全
- CTF
- moeCTF
tags: 
- CTF
- Python
- Crypto
---

# 【moeCTF题解-0x04】Crypto

*有多少信息熵，就能还原出多少信息*

> 信息熵=![[公式]](https://www.zhihu.com/equation?tex=-%5Csum_%7Bi%3D1%7D%5E%7Bn%7Dp_i%5Clog_%7B2%7Dp_i)
>

<br/>

现代密码学知识没学多少，倒是把Classic Crypto部分AK惹……

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






# Classic Crypto

6/6

## 大帝的征程#1

> 50points
>
> `zbrpgs{p0adh3e_gu3_j0eyq}`

有关密码的大帝就是凯撒大帝啦

随便搞一个凯撒密码解密程序：

```python
def encrypt(plaintext):
	# j即为key
    for j in range(26):
        str_list = list(plaintext)
        i = 0
        while i <len(plaintext):
            if not str_list[i].isalpha():
                str_list[i] = str_list[i]
            else:
                a = "A" if str_list[i].isupper() else "a"
                str_list[i] = chr((ord(str_list[i]) - ord(a) + j) % 26 + ord(a))
            i = i + 1
        print(''.join(str_list))

if __name__ == '__main__':
    plaintext = "pgieqi{k0_ajxW_k-R3zq?}"
    encrypt(plaintext)
```

输出如下：

```
zbrpgs{p0adh3e_gu3_j0eyq}
acsqht{q0bei3f_hv3_k0fzr}
bdtriu{r0cfj3g_iw3_l0gas}
ceusjv{s0dgk3h_jx3_m0hbt}
dfvtkw{t0ehl3i_ky3_n0icu}
egwulx{u0fim3j_lz3_o0jdv}
fhxvmy{v0gjn3k_ma3_p0kew}
giywnz{w0hko3l_nb3_q0lfx}
hjzxoa{x0ilp3m_oc3_r0mgy}
ikaypb{y0jmq3n_pd3_s0nhz}
jlbzqc{z0knr3o_qe3_t0oia}
kmcard{a0los3p_rf3_u0pjb}
lndbse{b0mpt3q_sg3_v0qkc}
moectf{c0nqu3r_th3_w0rld}     <-- 好耶ヾ(✿ﾟ▽ﾟ)ノ是这个
npfdug{d0orv3s_ui3_x0sme}
oqgevh{e0psw3t_vj3_y0tnf}
prhfwi{f0qtx3u_wk3_z0uog}
qsigxj{g0ruy3v_xl3_a0vph}
rtjhyk{h0svz3w_ym3_b0wqi}
sukizl{i0twa3x_zn3_c0xrj}
tvljam{j0uxb3y_ao3_d0ysk}
uwmkbn{k0vyc3z_bp3_e0ztl}
vxnlco{l0wzd3a_cq3_f0aum}
wyomdp{m0xae3b_dr3_g0bvn}
xzpneq{n0ybf3c_es3_h0cwo}
yaqofr{o0zcg3d_ft3_i0dxp}
```



得到flag：`moectf{c0nqu3r_th3_w0rld}`

*Ps. 可检测字符是否含有字符串来抑制输出*

<br/>

## 大帝的征程#2

> 75points
>
> `mpgfxk{j8w05q4_8xk_d7mhqfht}`
>
> 免费hint：`table = 'abcdefghijklmnopqrstuvwxyz0123456789'`

开了hint后就知道是凯撒密码的换表

于是修改上面那个程序如下：

```python
def encrypt(plaintext):
    symbols = 'abcdefghijklmnopqrstuvwxyz0123456789'
	# j即为key
    for j in range(len(symbols)):
        str_list = list(plaintext)
        i = 0
        while i <len(plaintext):
            if not str_list[i].isalnum():
                str_list[i] = str_list[i]
            else:

                # str_list[i] = chr((ord(str_list[i]) - ord(a) + j - i) % 26 + ord(a))
                str_list[i] = symbols[(symbols.find(str_list[i]) + j - i) % len(symbols) ]
            i = i + 1

        print(''.join(str_list))


if __name__ == '__main__':
    plaintext = "mpgfxk{j8w05q4_8xk_d7mhqfht}"
    encrypt(plaintext)

```

输出第一行就是flag：`moectf{c0nquer_th3_un1v3rs3}`



<br/>



## 外面的世界

> 75points
>
> 外面的世界很精彩~
>
> ```
> mc{i33ny_-n~otR1n_cp1FN}efaFc32Tsuy
> ```
>
> flag请准确提交

这个就根据关键词moectf直接看出来了，手撕解密：

```
mc{i33ny_-n~
otR1n_cp1FN}
efaFc32Tsuy
```

得到flag：`moectf{Rai1F3nc3_3nc2ypT_1s-FunNy~}`



~~其实是不知道栅栏密码~~



<br/>

更好的方法：引用`吉吉`的[WP](https://zhuanlan.zhihu.com/p/262761814)： 

> `mc{i33ny_-n~otR1n_cp1FN}efaFc32Tsuy` 栅栏加密，栏数为 `12` ，注意需要使用正向加密算法
>
> 因此flag为 `moectf{Rai1F3nc3_3nc2ypT_1s-FunNy~}`

<br/>

## 大帝的征程#3

> 100points
>
> `\>@64E7L4_?BF6C0E9b0)s$trN`

猜测字符表是ASCII可打印字符，一试果然是：

```python
# >@64E7L4_?BF6C0E9b0)s$trN
import string 
def decrypt(plaintext):
    symbols = ''
    for i in range(32,126):
        symbols = symbols + chr(i)
    print(symbols)

    for j in range(len(symbols)):
        str_list = list(plaintext)
        i = 0
        while i < len(plaintext):
            str_list[i] = symbols[(symbols.find(str_list[i]) - j ) % len(symbols) ]

            i = i + 1
        if str_list[0] == 'm':
            print(j,''.join(str_list))


if __name__ == '__main__':
 
    plaintext = ">@64E7L4_?BF6C0E9b0)s$trN"
    #            moectf{c0nquer_th3_XDSEC}
    decrypt(plaintext)
```

得到flag：`moectf{c0nquer_th3_XDSEC}`

更好的方法参考[吉吉](gitee.com/mmdjiji)的[WP](https://zhuanlan.zhihu.com/p/262761814)： 

> `>@64E7L4_?BF6C0E9b0)s$trN` 前6位与 `moectf` 做比较，发现差为 `47` 于是编写代码

<br/>



## 大帝的征程#维吉尼亚

> 100points
>
> 接下来去哪里呢?
>
> flag请准确填写.
>
> ```
>[Warning] Case Sensitive!
> ```



看到附件文本中的`pgieqi{k0_ajxW_k-R3zq?}`，应该就是flag了，把`pgieqi`与`moectf`比较，可以大致确定秘钥是`xdesc`，所附解密脚本如下：



```python
import string
def encrypt(plaintext):
	# j即为key
    for j in range(26):
        str_list = list(plaintext)
        i = 0
        while i <len(plaintext):
            if not str_list[i].isalpha():
                str_list[i] = str_list[i]
            else:
                a = "A" if str_list[i].isupper() else "a"
                str_list[i] = chr((ord(str_list[i]) - ord(a) + j) % 26 + ord(a))

            i = i + 1

        print(chr(j+ord(a)),''.join(str_list))

def decrypt(plaintext):
	# j即为key

    for j in range(26):
        str_list = list(plaintext)
        i = 0
        while i <len(plaintext):
            if not str_list[i].isalpha():
                str_list[i] = str_list[i]
            else:
                a = "A" if str_list[i].isupper() else "a"
                str_list[i] = chr((ord(str_list[i]) - ord(a) - j) % 26 + ord(a))

            i = i + 1
        print(chr(j+ord(a))+'|',''.join(str_list))

def VigenereEncode(message,key):
    pLen=len(message)
    kLen=len(key)
    raw = string.ascii_lowercase + string.ascii_uppercase  # 明文空间
    out=""
    ii = 0
    for i in range(0,pLen):
        j=ii%kLen
        if message[i] not in raw:
            out+=message[i]
            continue
        else:
            a = "A" if message[i].isupper() else "a"
            encodechr = chr((ord(message[i]) - ord(a) + ( ord(key[j]) - ord('a') ) ) % 26 + ord(a))
            ii += 1
            out+=encodechr

    return out

def VigenereDecode(message,key):
    pLen=len(message)
    kLen=len(key)
    raw = string.ascii_lowercase + string.ascii_uppercase  # 明文空间

    out=""
    ii = 0
    for i in range(0,pLen):
        j=ii%kLen
        if message[i] not in raw:
            out+=message[i]
            continue
        else:
            a = "A" if message[i].isupper() else "a"
            encodechr = chr((ord(message[i]) - ord(a) -( ord(key[j]) - ord('a') )) % 26 + ord(a))
            ii += 1
            out+=encodechr

    return out


def VigenereDecode(message,key):
    pLen=len(message)
    kLen=len(key)
    raw = string.ascii_lowercase + string.ascii_uppercase  # 明文空间

    out=""
    ii = 0
    for i in range(0,pLen):
        j=ii%kLen
        if message[i] not in raw:
            out+=message[i]
            continue
        else:
            a = "A" if message[i].isupper() else "a"
            encodechr = chr((ord(message[i]) - ord(a) -( ord(key[j]) - ord('a') )) % 26 + ord(a))
            ii += 1
            out+=encodechr

    return out


if __name__ == '__main__':
    raw = string.ascii_lowercase + string.ascii_uppercase
    text = """
    Qkjswdkgyv elkxqob, eepv gajhbuwrv hlfkflpk lcsh jmubq srf cddpgk; psra bphmtbv zexb ewip yrjr qrw gj plwzmpd dfh vehf gqiostubg ls trlf. Qckb zexb owh nxuyi copaiu qr llg yuarm li vicqk ar qogwv vl zjiuqow tqthj eyxb xvqj pakjqb jynbuk, ajfow svehjw jxyw vgilwh qk wziko dtmnfwq xq oddpa qkw qcpvww dbkarf qkwmt zdmwg, krtpg lu gxjbuomub. Zzev fv upgxu lltlxylqrw zmuqrjc, hore Nwilmw Exhket qr Yipdkaw Medf, mu qksx kq wsogp d vmuqlfgv mhjwqkddmvv wg ioydjo qk d uspnxwwv xqv ep bywr uqugribu viufuw xq xfzmgsh ksob jgen fq gvfbu ls qshjgqjh llg alxjkzxdx eeddpgkjww vedl eyxll.

Ajfow xjbuw mu kr zepaegsm qr yykah grg fq s gqktmiuq, wzitb dji ufpapco pgxksdlmqkv uspkhuxkkj ksob rx lkpwgva’p jjicqhkx elqiygorjw. Hlu wbcjsdi, veh jicprf iomljiu jdq izmdfh kp vg xjbb uep duga dlwz tjvvagcioq, gwiwmvcioq, st yrll. Hore 336–323 F.E.B., Ddizxqvit li Eeebggrkx (ddwq hqgap xv Spgudfhgo wzi Iohsx) plw grnv fgrsrhjif jrkx qc wzi mkror yludh, jb ddwq psjica Jjigh fmpvruw jtlp Wkamw ls Kkgae. Jb hfgqruskga fmpvrusp gufzepdh ar jfv wqrfuw, vgjdarkkj lsnbusrv li llg alxjgohfx nfiwwvvoww kk kaw pbz litollstfhk. Hwolfk veh kielqv ggkwmva Y.F.W., xjb Ugqck Hetkoh uspnxwvga Psggarfmc xqv mpzrjtqodlif qksx mfqyhqj dfh Iohwo erolytb lfxq fwk iomlji. Qshj xjb fgytph gj veh jikdq gj veh Yyrqd Wqrfuw fgqzwip 320 Z.H. srf 550 Z.H., axu idfhu duwa hore e ujddp rlulmqk rx rqowzitk Lfhkx wg ixbqlycioq wvohlgj cugq veh Svcylsr Ubd ls veh Tea li Tipddd. Xjfv hlapluen bahepplgr ellfgkahv akqk uynqxjen dugave igv veh Yyrqd Wqrfuw eu thdp, ckg whwzdlmqk dfh cow xpqruawjbg.

Llg psgmnp rx aco fsr db d kmiklxmexql qqqlnevfrf jqo fgrsrhkx. Kk wzi 13ve fwrvruq G.G., tkwr Ibqylkp Nzep ihv xjb Pgrilok mpqr tevqow, qckb gj veh ksnalwvu thji olwazcqhv xq tlf xjb uagjbv llgv xkycioq pcznwh, dblfk c kreefff hiqmow. Nwilmw Exhket tdk qqqlnevbg tc ybddxj xv oini, dfh kk isgv, fw oeu qkaw olwazcqlgr umhumhffspnv wzev ihv xq elk gqktmiuq rx Kcro (s vgdlgr qc Zwwvbuf Iworhi) kk 58 E.U.I. Drw hitedhw c jrji urvlekkdtpg jrlmxxwasp qksr rixfhgo lk gqkwjsn lywv vodvi. Hlu llg Jrfkqiv, uspqugpnfqy xjb Vapm Orsh—c khlaqon gj vodvi tlxliu pwjivzkari xfjsup Dkmc, Bdkx Ccuagc, xqv mpqr Wytlsw—acp dfsvehj evqusgvfyw qqqlnevlu xst bahepplgr. Gxudc qk, dlxcznk fa Jrfkqiv letdhlif pwsxgp wzev zrfxtlodif mdjxu li llg Pldo Tldv. Gjxqvvcdxhxc F rx xjb Jmtvx Hetkoh kxtxwwkkzddpa jdjvkbg llg Ilugjxya ttfquiup lf stahj xq fqustmrjevb pargp rx mtlq gvg, x yspwxedi vodvi elpesffwq, mpqr zmu hlfkflp.

Diibqvetv fgrsrhjstp, vmgj xv Spgudfhgo, Mmpkrv Uegpdj, epa Zapnfde xjb Fgrsrhjst, zuwevbg srf qkwr gussrfbg llgfu depav tiexxki qc d viufuw xq oxdi, elptmpbg omve jjicq swvulqsp cjeaxklq. Llkp defkqlgr rrvzif qkwq vl fgrvfqmi vl hptckg llgfu arhixwreb dfh umuwef qkwmt bphmtbv ls kkfdyfb pgvg idfh, oluw tglsdi, ckg, tc yxb gj vxaww ckg lvkyxli, oluw agxoll. Cihpepahj fgzdei mfqy sh Jduiflqae cq mmwv 20 vhsvu lov, okioari elk ipbpaiu yhxstb wzia zrmpf zkspnbqyi jfp srf zumwjfqy vgyhdpklqk. Lg ihv lkp fgrsrhkxu tlll ck xftcoddpgihv qkilletv duyobq. Bynfxk Gcbvsv jbov hkciwvgkw lmvihk mp Orei, txqympd ijso jldmvxuq xtfemrg qr hvcbwgv vl pwqdbu gj veh Xmtpw Lvkrpnmtxww. Mp qkwwg mrkmvfrfw, jb fgruloahcqhv lkp ror rlzwv ckg wbrxqvif Orei'u fqxpwbqui ckg oiciwz xjormkj jldmvxuq gqktmiuq. Zapnfde xjb Fgrsrhjst edjrgpvwh c plemnxu jiuloni cp Ddizxqvit xqv Gcbvsv, gpwsfnfvzmpd wzi rlzwv qc wzi uqdli qc Qgvoxqvc ckg vvcpwagcioq enqhjmpd Hfknfvz wqzlwxa fq zmu zrfuwbvl. Eu hlfk qc Hfknxqv, lg ohvmuquafwqhv xjb vlevb'v oiciwz, xtxqkjgouari mroit qr zmu mhgtnb, wzi Plueepp. Hsgj li llgph dicahjw’ eedjmujd zinmhv xjbp ls ixlf qkilletv vmtrlul xjxw oeu zumgkxo ar vehav elqiygpwk ajfow enpr hvqqhuxkkj llgfu hsufwaspp dk vwihjw.

Qkh'k tgofwmxbg jmiew ls trow, rqq mmwv ahkmtb, ksw civg qqqlnevbg zmuqrjc'u xqumgkw uspnxwwvp. Ddizxqvit yhdmgshv lkjvwph qr ti veh zenc-kmqck vgr qc rx xjb jgh Bbxk, epa wzyu bqlmvihv xq elk wwzfwwu. Tldpkxp dif qkw Rqopsr Elqiygpw ar 1066 dbfsyub kw fgilwzga kw acp wzi tfjzxhro ziko wg xjb Hfknfvz xjorfi. Mfqy Iftdjh jxg hvqjlkif qksx Yfodmcj zgyna ew lkp vmgebvkst, yxl lg edv enpr eefb wzmu mugqkph ls ubywvci rllgov, uewplfk ubywvci qwetib kmorolepbrmw dxwlpgp igv veh uvqtq sjvbu zmu ahsxj. Tldpkxp wzgkwmenib hvgsdapga, dkwwjlfk yedl lg yhdmgshv xq yh zmu olylvcxd tqpllmqk, dfh eedfkga Hfknxqv jqohnit fq zmu zrfuwbvl. Wqjh zmuqrjmckv llgluadg qksx Ibqylkp Nzep xoks dboaixbg llcq kaw hxww acp wg vwih, spvermkj qkw jqrqvevfrfw hlu llkp lvic xuw ypzowet.

Qkw htxz gj rlzwv, yelul exq usob lf qckb xstjv, aw ffixmerol xq nxsrvfiq fwq rnittkwpop wzsub wzev ahkmtb fgrsrhkx. Elqiygorjw hxfw sxbuolgipari adfkgov xst x fzepzh ls trow fwq ewpkbyw xjb uwacog gyvthakjp wzi tfvc.

Xjb hetgorj gqktmitbg llg trjpf, zrfuwbuwh veh mrkshjwg, xqv jkkddpa rqajkbg wzgobllkkj zi elxdh ubh. Sjvbu xigilfk jfv gap bixstqv, zi tbpwqdbuwh c cdeswp vsckkj: A gcjh, A wct, L uspnxwvga.

pgieqi{k0_ajxW_k-R3zq?}
    """
    mO = "moectf"
    m  = "pgieqi"
    key = 'xxxxx'
    anskey = ''
    for i in range(len(key)):
        for j in raw:
            if (VigenereDecode(m[i],j) == mO[i]):
                anskey = anskey + j
                break
    print(anskey)
    
    print( 'D:', VigenereDecode(text,'xdsec')  )
    
```



另外的方法参考[吉吉](gitee.com/mmdjiji)的[WP](https://zhuanlan.zhihu.com/p/262761814)： 

> 根据 `A gcjh, A wct, L uspnxwvga.` 可能是凯撒大帝的名言 `I came, I saw, I conquered.` 因此根据密码矩阵对密码，对出来是 `secxd` ，也用以解密flag得 `I came, I saw, I conquered. moectf{s0_whaT_s-N3xt?}`
>
> 因此flag为 `moectf{s0_whaT_s-N3xt?}`

<br/>

## 大帝的征程#维吉尼亚Ex

> 250points
>
> 我听说有人觉得密钥很好猜？

看到附件文本中的`ooukot{ig3_oqf1_Ymiedmms_BzVn3_s0w_w0_3csO}`字段，应该就是flag了，把`ooukot`与`moectf`比较，可以确定部分的密钥。根据文章特性和重复字符，可以确定秘钥长度。从而解出一些原文零星的句段，百度这些原文的句段可以明确此文是《终末之诗》，就可知道剩余部分明文，从而得到完整秘钥。附解密脚本如下：

```python
import string
def encrypt(plaintext):
	# j即为key
    for j in range(26):
        str_list = list(plaintext)
        i = 0
        while i <len(plaintext):
            if not str_list[i].isalpha():
                str_list[i] = str_list[i]
            else:
                a = "A" if str_list[i].isupper() else "a"
                str_list[i] = chr((ord(str_list[i]) - ord(a) + j) % 26 + ord(a))

            i = i + 1

        print(chr(j+ord(a)),''.join(str_list))

def decrypt(plaintext):
	# j即为key

    for j in range(26):
        str_list = list(plaintext)
        i = 0
        while i <len(plaintext):
            if not str_list[i].isalpha():
                str_list[i] = str_list[i]
            else:
                a = "A" if str_list[i].isupper() else "a"
                str_list[i] = chr((ord(str_list[i]) - ord(a) - j) % 26 + ord(a))

            i = i + 1
        print(chr(j+ord(a))+'|',''.join(str_list))

def VigenereEncode(message,key):
    pLen=len(message)
    kLen=len(key)
    raw = string.ascii_lowercase + string.ascii_uppercase  # 明文空间
    out=""
    ii = 0
    for i in range(0,pLen):
        j=ii%kLen
        if message[i] not in raw:
            out+=message[i]
            continue
        else:
            a = "A" if message[i].isupper() else "a"
            encodechr = chr((ord(message[i]) - ord(a) + ( ord(key[j]) - ord('a') ) ) % 26 + ord(a))
            ii += 1
            out+=encodechr

    return out

def VigenereDecode(message,key):
    pLen=len(message)
    kLen=len(key)
    raw = string.ascii_lowercase + string.ascii_uppercase  # 明文空间

    out=""
    ii = 0
    for i in range(0,pLen):
        j=ii%kLen
        if message[i] not in raw:
            out+=message[i]
            continue
        else:
            a = "A" if message[i].isupper() else "a"
            encodechr = chr((ord(message[i]) - ord(a) -( ord(key[j]) - ord('a') )) % 26 + ord(a))
            ii += 1
            out+=encodechr

    return out


if __name__ == '__main__':
    print(len("occ qtj xrkvuzns hzfp N osxe owp".replace(' ','')))
    # decrypt('x')
    raw = string.ascii_lowercase + string.ascii_uppercase
    # text = "ooukot{ig3_oqf1_Ymiedmms_BzVn3_s0w_w0_3csO}"
    text = """N vig txm kzpxbd dry oeqv.

gidp1xz?

Dhw. Vaam xogd. Ff mdw teqkcss z eulkit ludzz cnt. Uy fep ruiy cjq qttxkjti.

Bcoi clqxq'x oajbzf. Xs qtnqou wu ims ezof ti xje wihs.

X kfwj wlks ftvmtq. Ff uoeaet ezza. Hq png rqt wqqs jo.

Ff nv vgatqiu dto fmryihja vg iglglk xjeo ezft vldiv sp a ikmstm.

Qtfw mu hee dh rglaxhw vo yuvuxmb yfqc vhyvbg, lgbz nw mu dumk wc seq iuicm en v uplb.

Ituhu mqsz o lnkpjujwl yvosgexoj. Yity vtzlxaiq. Fqh neia osgqfrdlri txii gizousj ev txm mspkffd eijidl ovt rzdjhr.

Vhug pgtc qa mhet veqxsh. Abrtui rlqgzfh blgqg vgat. Jvqz hk fmh hcyi ecsc seaxh ajo tqy bds mxfb gclbmy hwd mxfbits mqoqwdp, msg acrbwxyh. Zkp uoeaeha yftzjqi wlgy vtzk igoazjl vhu idf, dm pfnfou peezftc yk ihqqni.

Ecoi cfp ykmu pbitsg coqfp?

Xjii xgondo pwheoet wa gjmiulkx cnt bmstr. Lr klvg adl roido. Uy gvgacmy wi boqfwif. Adl dh sqbmrhh kt tmnhgnvqi. Lx fruihss hq tzqxgd, qvy kpr egswif. Ij lmsplbp ti wjebbzf.

Wze, fmh stiwqioa hkfjujccu. I hwakfas bicri wgr, pma uy vxklb ejfzr. Ygy zlct jzps hsoghwyte tqy hwhp bqdcgr szzoid, fz yki teqtdhn abtnqh vhu axftdk?

Uy zstkul, rwig x ynopkod wovtqp, ft vgwlfb v hgtb itupf id i acac lr yki ooukot{ig3_oqf1_Ymiedmms_BzVn3_s0w_w0_3csO}, iir rqbmyhh c byo xftzqgwh jqr xqhgtkc, us wlg wezgr.

Xs zmsqsv ruiy hwzq fmryihj.

Vj. Wi gxe srx aej ixvxdsqi wlg hyocshs iqahp. Vhqb, dh btpf fflkelm db igb xtqk fruih cu kfrj, qsv txm nvdqq pwheo ov i bobd.

Aajv mv kdwr hwzq ij osxe yb? Ovps qtj xrkvuzns xr husg?

Wqmubdatr, qtwryih jpz bdhpq ti mvs jpjivgqe, nw lgaha ovt tkuahvue, omn.

Pjs qtjui cru bdatr ff nv wcd, yv ovt klzl gvgac. Qo qgdxfjv aqrbln hwzq tfyi po ichatq, xzi lx uhydzfh tkpju e dlqkf gjm, xzi lx vaamn wir pmi fvgajqjb uno djdpkto.

Bj qjqb uy rj uohzjk lnrxi giuthwt wi. Seq xrvtom qn dpqq ak lxu omv kfxuxfj weuk. Mm xocmlf nqxgrvmms.

Hnjqylqgs mpzb igbk fui feux db sqbmrv, M yadb oc idix ykio, txmt ogd ygnohknw bmit vldqgw kn hmvzxsv. Etpivicmn W lzkf yr xglb bcsb nc fmhmt icxjfizkoj ws vhu ciwkdoej. Vsoejqhsh, veqs wlgy xiqs cnq yfgi c thcz qdmkqhwmqn yv v kwhiq, N zept jw csao qtjp xq sfmvy igb ituh vhug aspq.

Ff whefs ecm hwnrsmww.

Uocmowbdp U ir rqt sims. Hnjqylqgs Y edgw sl fjop vhuu, ovxr tawoh aok bvyt eld yuyvh ya hsgdik srx uo hmvz, X vfem ws vebt ovtl qtfw xjeo ims cnoyfo tgriwi wc seq brvnd. Jpzm hdb et omvtbm jt gdxxnwc, kn jpzwg klzl gvgac.

Iir ndq fmhc rlqg ovt fxyj.

Eyv ij ejiac yq xr icso bj htki fmhq...

Voe aofdmd rtu xjii lmspl. Qa yhpn txmh vdv qa qlzg ii bj dgdsqsw xjec tdjxmd.

U blpn neb osak qtj spcyuz ccl sl xnyi.

Vhu xgondo ux jvqwyvb ftrqxjvw.

K wytg htki fmh tnaomm o hsldd.

Eyv neb ovt sogyk.

Rq. A ibjfn semy fsptqqig igb fwxxj sqnzzn, hk m hdkg ov ejfsr. Kay wlg nqszr iqrfm wlct sii pjqk aahv cno ldgizkoj.

Jmxe yb v pdcv, mldmp.

Yua. Kzpxbd...

Zvi kti vvat.

OIMDHVPACM. Kzpxbd ti kcmua.

Bcdc.

Qmph e druiov, cnt. Ffni cnebcsg. Ebqq dmt id gjig krzlv. Pgt owpf ahjnx uivuhv. Tsh, llhj bswr vqiutqp. Tfyi c belt ovzfz, zqhgr wzvjxsv, us dmt. Ruakolm fz yki nodo yftzj. Fmhvg yec vft. Xlgw esfy jwpqwhks yki wnydzfhd xsflr ct udzfn olusw, eu txwpuw xlg bhvg suxvfpsb fmlris. Qa ovdtdt bh agru azdpqxfj wlknwa.

Rvd zoq bh? Spcu ez ktqb ofopgd jpz gehouy rj vhu ujicsxus. Ievhuz nic, llfmhv ooev. Vbrdpfwdp upyzdhh, zkurdp upyzdhh. Ifzs. Jlqsja. Ovt foqjq qcn. Jpzb vnae, ihqqni. Iiutkp. Btoxgrwmdgir. Xxnhru, enbmoidodjvxtiqtn. Ztoqasv, uwahsn. Hwd tawgw ehqvbs. Ld aa srx ehqvbs.

Ld xdj wlg udqqsgrb. Ij dvg elmmmigfzl bsw txqiy xrk'f dry. Aok ims anlwnqk ct ka icl, sedtxkj yecm gzhk msg cquh mtsh. Zkp bkc foua ovt tkuahvue jwpqw xlgw vokn, qvy hwqli qlkjt ev tcj? Sl ejh cqu, ftvmtq. Qa pqsy yec. Vbs sl nj nrqwd. Q nvpki fjop aok i nhdqv.

Asfi wpev v hxlb, fmhvg wqa v dazvqw.

Wlg pbitsg vxe dry, RLQGZFCZJQ.

Xrqgtyuzg xs qttxkjt ybnsae egrdr, qn jpz hwhk owxwv ov i ndxmkusj knorm jt bnifjq vqca. Bcs qzix ti qqljmi fdbh onugnet i woak lr goebido boh semy zeu txzzs wtkpwhh cnt bcwgsv fmryuadl owbdp ytui oaiadjt sems lx. Vhug rsgd pa kdv cpqzo hwzq xnjlv tewf sxfef rlrwtua oc rqlex wlg gqx. Ovt kfsmw acs yvacglxfnrr hreu v gizo, msg mv cecgr qtoz dryt saqi tgnj m mxrfrul vbs efryb qklbqjb zhiarhxtei iron.

Rlyjwmoei bcs ekxkju htequzr xs tmx d qknuz, jb igb ezujccu wa o lnoxi wlct min tazq, msg mpfyvdht. Seq xxr yai i nejzoq ti ajijm. Ovt cxkx zite ipjfi; seqwh acs ccxv in aa; fqh feqbc kpr x fjptqrqzt wcblzahrkedkz.

Gdlbfnpiu txm kzpxbd iuicmul dh lzp xtvx kn q aocgx.

Parhxkmua ovt oimdhv fruihss hq ifv svhuz ovxmde, nq svhuz kzpbbe. Xrqgtyuzg igbej gvgaca rsgd auxwytbyvb. Gdlbfnpiu vuzt ptzrfniyn idlzss. Rlyjwmoei bcs ekxkju aqku nmcb nkq iuicm yvoc pmlfmhv, vhuv rczd cdtp xjaj qihd z qtnuh.

Uocmowbdp fmh tnaomm rgdxyjg mv wqbxvtc tawgw qn q axftdk.

Xjw'w io rixy.

Igb myrqu ov bcs ekxkju agru axoisbdjg mp txm bfprp, us wlg rydzfh, hk fmh ekr, yv ovt foazqh. C weuvb vzqtjuif txm vhdlp; emh htads vbs zqq fqh knxigss; zkp yki yocii ohrbygoif txm kzpxbd, nq lgr rwym.

Pma fmh tnaomm olnhq, kuso txm rogl, amwn aqrbl jt xsp ytwlgr'i jjrn, hkft wlg levb rgdxy.

Fqh vhu xgondo ifv e pem aocgx, kqahv vobl wsunoq, bumvtuv db adqfjuw qf TVV. Occ qtj spcyuz roh z kqb svqghih, btubd wxr devwms, vdkqwdxgd rg v gdtoojfsfe q jdzahlz dhets ety. Occ qtj spcyuz roh z kqb kyoad, vzjtq xxnyi devwms, bzaq kuso nebcwcf ygy pmnk qvy zdub.

Ktx ete jpz dazvqw. Wlg sjwmm. Igb bwrktac. Bcs wtjms. Pefe vzja cnqtnqk duj udzz zkp qrzg.

Lub'n ud erdykit bqkf.

Hwd pqahr dibtdcc afxqlsp bytgwdm xftpw qf jpz dazvqw'v fqdo ezft boqfwif, levb pteldj wlks wihs, xm qtj kicrj wa o hsxd. Xr xje ftvmtq, qat, lw knvwmapsfas ivqm q aoog. Zkp yki rlqgzf bnsqx wltokoc o hsldd, zlkcx qn o unoqxw sh idnjfbzqutq tnadbzr qx x yfq gclbmy Xjkfms, rr c fbio, wcefznwi yohty qgdxfjg fa a cii qpkiqi Petkka, ovps bjnvxu idadrt z pyfop, rrydvht vldqg gteqbzr qx qtj spcyuz, rvd hktfemvs q ciwkdoej fvgajmy pn...

Regxk. Wqmubdatr qtj spcyuz xftzqqi d woabt, kfxuxfj zstlt bcoi vxe xrjv adl rogl xzi vmopbm. Ncbdqurhw jahl, vbs blxi, drf ceukzxbxfjg. Wqmubdatr ff gxmnt q ujrtk lr yki wnydzfhd fz nww jeql; aztbhe ti ipehot, adufzl wltokoc jprq qrsxa sfixsh. Rlyjwmoei qo qpkiqi wlqsu ngsrjp "qqhgvrevn" occ "mdtwsps".

Iwhsihjqx lx eabtzr igby "uoepeja" vbs "rqmwv".

Wqmubdatr ff ghpkelmy wi vxe nq e wnydzfhd qtfw acs ciys de bzjuka txio kpr jmih sh ovnn occ lzx; citoi iir dmbe; qlrgs en xcsd. Parhxkmua dh qdiujyif ij evg ekxknqk c gquz. Gdlbfnpiu ij jzzxdsqi lx yai zzoshks brvfs ev v grqbqs.

Bsw ahm ovt oimdhv, teqldbv vldiv...

Wjuip... Ncbdqurhw vhu xgondo djdh nidmn cu blpj rr c sszzsc. Cbotgif txmh wcsl ituhu; dukjrtc tawgw knjw hspmfzl; gieotmy atzkusj mpte nzsahksx, hqqtywig, igbawliu, itmvg, pma fmh tnaomm gizofjg xq bhmvhwd cmxwit adl ystobd fqh teqtdgtc ff bdw clydz, wi vxe fomxe, jpjgt seazvepd tmvhwr emi qsv bumi ftzi, fmh tnaomm kpr xxnyi

Aok. Gji. Nnr mwh enilm.

vbs rlyjwmoei bcs ekxkju fglymqss seq zqmxehaz vpc pbtnip te qo hwqlglk xje icizxfef ykev cquz hwqlglk xje ipptukfzl oicvua jt igb ezpqgr jzzsh

zkp xrqgtyuzg igb bqdcgr rmgwtubp yki wnydzfhd emi vtqkuv oc xs qtwryih jpz zxfef ykev futg tgnj fmh gtiix iwvgq epb sh wyvosg, veqwh e hlukf cu kfsmw mp txm xcgmbd ti xje ftvmtq'p qdh qkgxb ws p rqmw d qklbqjb ihjqx dw oaiadjt zp fmh wwn, rwdzxmd uyv tnadmog in mxfvqc id wmrtq qa gh zksyjgs uno m rrqgnj bj hwd mxfbit, wqtfwcf earh ev txm aog rfpj rj vhu ciwkdoej, vyfduvgm hlbxqlri fewy, oalley dx vhu nvaxkfmw gsqr, qjjii sl pwheo awidb

pma etpivicmn hwd mxfbit butdskda fmh ypilmmgt gxp xssmed bj wi sedtxkj txm usgnp msg spei, bcfdtdt yki glukofxbffd rj vhu ejfac, qtwryih jpz grqlxqlri wezyg dm x ehuign qb ovt dkp ti e fruih

occ qtj xrkvuzns hzfp N osxe owp

occ qtj xrkvuzns hzfp dry jalm kzpxbp yki iacm rsak

xzi wlg udqqsgrb eflh gvuzthwhks dry peul dg lhqtnq cqu

qvy hwd rznyitsu avws xlg fui uthwiutq qtfq cqu avjk

pma fmh ypilmmgt rxui bsw ahm ovt cxkqlkjt

qvy hwd rznyitsu avws xlg fui vhu vduws

xzi wlg udqqsgrb eflh vhu lvfzmbex bsw fyoch xr tuykmp yec

vbs seq zqmxehaz gpha fmh pkgxb tcj rbqp lw yijpdb nnr

msg xje kvdjtqpq xdmf yec vft mlf fospe

qvy hwd rznyitsu avws xlg fui poj azdpqxfj ivqm udzfn nqtju xjido

vbs seq zqmxehaz gpha ktx ete jpz ichsqwvi vaibdbv hqejoj, vabsdbv sl uyvinf, hmvrxmd uyv syn swys

pma fmh ypilmmgt rxui L pqvu gji qdzmzvi aok ims ansq.

Fqh vhu ovat vxe tyit adl ovt oimdhv yoam pd uqly yki fruih. Occ qtj spcyuz wsvzk m sha fruih. Occ qtj spcyuz yftzjqi dkcid, lmsplbp ghxveh. Iir igb bqdcgr min hwd rznyitsu. Iir igb bqdcgr min zdub.

Ktx ete jpz dazvqw.

Zeme kx."""
    key = 'fdecaqivopzxmfdecaqivopzxm'
    print( 'D:\n', VigenereDecode(text,key)  )

    print( 'D:\n', VigenereDecode("XXXXXXXXXXXXXXXXooukot{ig3_oqf1_Ymiedmms_BzVn3_s0w_w0_3csO}",key)  )

    mO = "YesTakecareIthasreachedahigherlevelnow. It can read our thoughts."
    m  = "DhwVaamxogdFfmdwteqkcsszeulkitludzzcnt. Uy fep ruiy cjq qttxkjti."

    anskey = ''
    for i in range(len(key)):
        for j in raw:
            if (VigenereDecode(m[i],j) == mO[i]):
                anskey = anskey + j
                break
    print(anskey)

    # moectf{th3_rea1_Vigenere_MaYb3_n0t_s0_3asY}
```



得到flag：`moectf{th3_rea1_Vigenere_MaYb3_n0t_s0_3asY}`



更好的轮子参考[吉吉](gitee.com/mmdjiji)的[WP](https://zhuanlan.zhihu.com/p/262761814)： 

> 使用重合指数法破解维吉尼亚密码，[工具地址](https://www.mygeocachingprofile.com/codebreaker.vigenerecipher.aspx)，解得密钥为 `fdecaqivopzxmfdecaqivopzxm`
>

<br/>

---

# Crypto

6/10

## crypto入门指北

> 50points
>
> 使用markdown可获得最佳观看体验（当然用记事本也能看）

附件如下：

> **Crypto入门指北**
>
> *关于密码学*
>
> 顾名思义就是研究加密的学科。比如要在Alice与Bob两人通信过程中，在有Eve窃听的情况下，依然保证消息不泄露，这就需要Alice用一个加密密钥（类似于开锁的钥匙）对信息加密，而Bob将收到的信息用解密密钥解密，这样Eve就无法得知通信内容。而凯撒密码就是十分著名的一种加密方式，将字母移位，从而达到加密的目的，凯撒密码属于古典密码，在平台的Classic Crypto分类中就有许多这样的密码。但是它们的安全性都基于对加密算法的保护，一旦加密算法暴露，哪怕没有密钥，也能够进行解密。因此，现代密码学要求在加密算法公开的情况下，只要不知道密钥，就无法对消息进行解密。这样的话，仅需要保护一个不算长的密钥即可保护一段信息；即使密钥泄露，换个密钥就能继续用同一个加密算法加密。所以，密码学就是要寻找一个在不知道密钥情况下无法破解的算法。因此，下面这些题目，都会有一个用python写的加密脚本，这些都是有漏洞的加密方式，你需要从中找出漏洞，并且在没有密钥的情况下恢复明文。
>
> *密码学需要什么基础知识*
>
> - 数学基础： 密码学是数学的一个应用学科，最早的公钥密码算法RSA就是基于数论的，因此学习密码学通常还需要从数论开始学起，公钥密码往后发展的过程中，也逐步用到了线性代数与抽象代数的内容，那些东西由于过难在本次新生赛不会涉及，因此请先从数论开始（除了用于防大佬新生ak的Easy RSA有用到线性代数的复杂知识，想要钻研的这题的新生请慎重）。其次，最早不是基于数学的块密码，在发展的过程中，也被运用数学的语言来描述，从而更能够更清晰的找到攻击方法。因此，学习密码学会涉及到大量的数学知识，欢迎对数学感兴趣（至少不讨厌）的同学来钻研学习
> - 编程基础： 现代密码学比古典密码复杂许多，它的加密解密算法不是人能够口算或者笔算出来的东西，因此也需要编程。而密码学由于经常要用到特别大的数字，远超c和c++的long long int的上限，因此一般使用python编写程序。python是一个较接近自然语言的编程语言，因此容易上手，灵活运用搜索引擎以及网上一些教程很容易学会。
> - 英语基础： 你有可能会遇到一些需要阅读纯英文文章才能解决的题目，需要有一定的耐心才能看明白。
>
> *密码学需要哪些工具*
>
> - python
> - 两个用的挺多的python库：pycryptodome，gmpy2（网上均有安装方法，使用方法也有，也可直接查文档）
> - （sagemath）对初学者来说用处不大
>
> *如何学习密码学*
>
> - 善用搜索引擎
> - 在ctfwiki的crypto分区寻找一些crypto的基础知识
>
> *我在做题时遇到困难怎么办*
>
> - 先去各大搜索引擎轮番搜一遍
> - 阅读《提问的智慧》
> - 寻找管理员里那个密码fw寻求帮助
>
> 当然，就算做题没遇到困难，只要对密码学感兴趣，也欢迎去找那个密码fw闲聊.并教教他密码学，他可菜了。
>
> crypto是个比较小众的方向，但也相当有趣。会有很硬核的数学让人想放弃，但坚持下来慢慢搞，一定会有很大收获。
>
> moectf{I_L0Ve_M@th_AnD_CRypT0}

thx~

`moectf{I_L0Ve_M@th_AnD_CRypT0}`



<br/>

-----

## Stream

> 100points
>
> Script:
>
> 见附件
>
> OutPut:
>
> ```python
> 1 
> b'Og9hNAFrCjU9aQ4+C2psLzxpYRE6azw+FmphPgk2EjQBDyw+DWsKIQIPHiwAaBYoOx8wNBU2aGU='
> ```



附件：

```python
import base64
flag = "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
xor = ?
print(len(xor))
print(base64.b64encode(("".join([chr(ord(i)^ord(xor)) for i in list(flag)])).encode("ASCII")))
```

根据OutPut可知道xor就是一个字符

那么直接暴力搜索之：

```python
import base64
import string
import time
dic = string.printable
flag = base64.b64decode('Og9hNAFrCjU9aQ4+C2psLzxpYRE6azw+FmphPgk2EjQBDyw+DWsKIQIPHiwAaBYoOx8wNBU2aGU=')
print(list(flag))
for xor in range(512):
    # time.sleep(1)
    outf = "".join([chr((i)^xor) for i in list(flag)])
    try:
        outf = base64.b64decode(outf)
        if(outf.find(b"ctf") != -1):
            print(xor)
            print(outf)
    except:
        pass
```

运行脚本得到flag：`moectf{U_Kn0w_How_7o_Break_Stream_Ciphe2}`



<br/>

---

## easycrypto

> 100points
>
> Try to step in the door of Cryptography and mathematics！

下载附件是一个加密脚本

```python
from FLAG import flag

def enc(plain):
    cipher = []
    for i in plain:
        m = ord(i)
        cipher.append(5 * m ** 2 + 6 * m - 8)
    return cipher

print(enc(flag))


#[60051, 62263, 51603, 49591, 67968, 52624, 76375, 38359, 51603, 58960, 49591, 62263, 60051, 51603, 45687, 67968, 62263, 45687, 22839, 65656, 73923, 63384, 67968, 62263, 78867]
```



啊，是可爱的一元二次方程！就直接解吧，只考虑大的那个解试试看：：

```python
def enc(plain):
    cipher = []
    for i in plain:
        m = ord(i)
        cipher.append(5 * m ** 2 + 6 * m - 8)
    return cipher
flag = "2333"
print(enc(flag))

def denc(plain):
    cipher = ""
    for i in plain:
        i = int((-6 + (36+4*5*(8+i))**0.5) / (2*5))
        print(i)
        m = chr(i)
        cipher = cipher + m
    return cipher
flagd = [60051, 62263, 51603, 49591, 67968, 52624, 76375, 38359, 51603, 58960, 49591, 62263, 60051, 51603, 45687, 67968, 62263, 45687, 22839, 65656, 73923, 63384, 67968, 62263, 78867]
print(denc(flagd))
```

运行脚本，竟然直接对了

得到flag：`moectf{Welcome_to_Crypto}`





<br/>

---

## simple_number_theory

> 150points
>
> Simple integers are also magical

下载附件是一个加密脚本：

```python
flag =  b'moectf{xxxxxxxxxxxxxxxxxxx}'

p = 702642074436764837683441695539

a = 1086077784009247
b = 862805818180723

def padding(m):
    lenth = 8 - len(m) % 8
    return m + chr(lenth).encode() * lenth

def bytes_to_long(s):
    res = 0
    for i in s:
        res *= 256
        res += i
    return res


def enc_block(m):
    return (a * m + b) % p

def enc(m):
    m = padding(m)
    c = []
    for i in range(len(m) // 8):
        c.append(enc_block(bytes_to_long(m[i*8:i*8+8])))
    return c

if __name__ == "__main__":
    print(enc(flag))

#[609157021623541347403691228214, 296649570588624720860438742570, 56199496972820506761619039889, 95133897800551968959628311224]
```



绞尽脑汁写出解密脚本如下：

```python
import string

p = 702642074436764837683441695539

a = 1086077784009247
b = 862805818180723


def padding(m):
    # 长度补全
    lenth = 8 - len(m) % 8
    return m + chr(lenth).encode() * lenth


def bytes_to_long(s):
    res = 0
    for i in s:
        res *= 256
        res += i
    return res


def enc_block(m):
    return (a * m + b) % p


def enc(m):
    m = padding(m)
    c = []
    for i in range(len(m) // 8):
        c.append(enc_block(bytes_to_long(m[i*8:i*8+8])))
    return c


def dnc_block(m):
    i = 1
    while(( (m + i*p) - b ) % a != 0):
        i += 1
    return ( (m + i*p) - b ) // a


def long_to_bytes(res):
    s = ''
    while(res > 0):
        s = chr(res % 256) + s
        res = res // 256
    s = bytes(s, encoding='utf-8')
    return s


def dnc(c):
    return long_to_bytes(dnc_block(c))


if __name__ == "__main__":
    flag = b''
    flag += dnc(609157021623541347403691228214)
    flag += dnc(296649570588624720860438742570)
    flag += dnc(56199496972820506761619039889)
    flag += dnc(95133897800551968959628311224)
    print(flag)
    # moectf{Integers_@re_W0nderful}

```

得到flag：`moectf{Integers_@re_W0nderful}`

<br/>

---

## rsa_begin

> 150points
>
> Do you know RSA?

*经过四大关卡，终于可以初窥线代密码学啦，oh_my_RSA*



附件中代码如下：

```python
# from gmpy2 import *   <-- 注意：这个库我装载不了，官方也好像弃用了，于是我用了其他的库来代替它 下同
from Crypto.Util.number import *

flag = b'moectf{Integers_@re_W0nderful}'
q = getPrime(1024)
p = getPrime(1024)
n = p * q
e = 0x10001

m = bytes_to_long(flag)
c = pow(m , e , n)
print('c =' , c)
print('p =' , p)
print('q =' , q)
print('n =' , n)
print('e =' , e)

#c = 12786994906832886031173089454539830225421640443805160963440942546071910322282773910135388020414967368794768319321460372875327006020157548651622969466323905189761834455201291838045352561790791600881627927594863932384116760236609096504346833060291203939690475993692410973499329433726175351882818053841075210942250478835641657575946226612389154039920962506062857726362447590070697348315291411570674334126096132112365825105842643843896421848410966564321518660727994853036555116782763422065173850238826345797198901647320210828033061322523971939726188821545177029535860881611210887039411052848607563035583276075332653567834
#p = 161719691876167304386300539654699854745688262478039691942271426308613132466937889105173933022986654040443219708318126579048996288583272346602042650222520127626611975688909019632479930508343350314542889627461529623000987307169157443265879212155437165660477850241678385286601587538517091605374764970915451201471
#q = 131679150542057883837006988923642169851011066771905140540444762603374903776910595387305441746623070810587630852182725227845916400198693359271062585498062084740896090668288333576457754165324164735966791029516030696195703650691726650990903496820364700241229117883279657833543807874786274886417501405960125022153
#n = 21295111652177049852547386222656846645616549922902112221240647622752994625687294739828756977846793220378085163155773051922086862363248151399852421844018730199066331944608000906761112010951655369036878807145188296884981895884278542857120225505310980291226351653588799242142355376939447934804833830853036785704513557039806761305316841740131204576974408869765714675230132247412774215945663807730855436503625577606009921411947891570324777735323489304604987902364932089976811865007609745513534209603256719511305317200247134396733168695387708420206468160279271453425776388025425790010391137010735121696446552257334341187063
#e = 65537

```

先学一学啥是RSA吧。虽久仰大名，但还不知道其具体原理……

> RSA 加密算法是一种非对称加密算法。在公开密钥加密和电子商业中 RSA 被广泛使用。RSA 是 1977 年由罗纳德·李维斯特（Ron Rivest）、阿迪·萨莫尔（Adi Shamir）和伦纳德·阿德曼（Leonard Adleman）一起提出的。RSA 就是他们三人姓氏开头字母拼在一起组成的。
>
> 
>
> RSA 算法的可靠性由极大整数因数分解的难度决定。换言之，对一极大整数做因数分解愈困难，RSA 算法愈可靠。假如有人找到一种快速因数分解的算法的话，那么用 RSA 加密的信息的可靠性就肯定会极度下降。但找到这样的算法的可能性是非常小的。如今，只有短的 RSA 密钥才可能被强力方式解破。到 2017 年为止，还没有任何可靠的攻击 RSA 算法的方式。
>
> ——[CTF Wiki](https://wiki.x10sec.org/crypto/asymmetric/rsa/rsa_theory/)
>
> 
>
> 
>
> RSA算法的具体描述如下： [5] 
>
> （1）任意选取两个不同的大素数p和q计算乘积
>
> ![img](https://bkimg.cdn.bcebos.com/formula/f0dac18152076624d87832b62709895c.svg)
>
> [5] ；
>
> （2）任意选取一个大整数e，满足
>
> ![img](https://bkimg.cdn.bcebos.com/formula/c33d8c66364a636b051d82f0ee202a36.svg)
>
>  ，整数e用做加密钥（注意：e的选取是很容易的，例如，所有大于p和q的素数都可用） [5] ；
>
> （3）确定的解密钥d，满足
>
> ![img](https://bkimg.cdn.bcebos.com/formula/da8649c0078a0a842779394d64011776.svg)
>
>  ，即
>
> ![img](https://bkimg.cdn.bcebos.com/formula/4dee3f4df52a81983db0e3c619f96058.svg)
>
>  是一个任意的整数；所以，若知道e和
>
> ![img](https://bkimg.cdn.bcebos.com/formula/679e809a0d964785d0aa4cfcb4218742.svg)
>
> ，则很容易计算出d [5] ；
>
> （4）公开整数n和e，秘密保存d [5] ；
>
> （5）将明文m（m<n是一个整数）加密成密文c，加密算法为 [5] 
>
> ![img](https://bkimg.cdn.bcebos.com/formula/5947116555169dc6fe9e3f5cdf347706.svg)
>
> （6）将密文c解密为明文m，解密算法为 [5] 
>
> ![img](https://bkimg.cdn.bcebos.com/formula/1a8b337167e4d4b2c23855d88ec4c67f.svg)
>
> 然而只根据n和e（注意：不是p和q）要计算出d是不可能的。因此，任何人都可对明文进行加密，但只有授权用户（知道d）才可对密文解密 [5] 。
>
> ——百度百科

再回看题目给的代码，发现它已经把私钥都给我们了，于是根据算法直接解密吧：

```python
from Crypto.Util.number import *
c = 12786994906832886031173089454539830225421640443805160963440942546071910322282773910135388020414967368794768319321460372875327006020157548651622969466323905189761834455201291838045352561790791600881627927594863932384116760236609096504346833060291203939690475993692410973499329433726175351882818053841075210942250478835641657575946226612389154039920962506062857726362447590070697348315291411570674334126096132112365825105842643843896421848410966564321518660727994853036555116782763422065173850238826345797198901647320210828033061322523971939726188821545177029535860881611210887039411052848607563035583276075332653567834
p = 161719691876167304386300539654699854745688262478039691942271426308613132466937889105173933022986654040443219708318126579048996288583272346602042650222520127626611975688909019632479930508343350314542889627461529623000987307169157443265879212155437165660477850241678385286601587538517091605374764970915451201471
q = 131679150542057883837006988923642169851011066771905140540444762603374903776910595387305441746623070810587630852182725227845916400198693359271062585498062084740896090668288333576457754165324164735966791029516030696195703650691726650990903496820364700241229117883279657833543807874786274886417501405960125022153
n = 21295111652177049852547386222656846645616549922902112221240647622752994625687294739828756977846793220378085163155773051922086862363248151399852421844018730199066331944608000906761112010951655369036878807145188296884981895884278542857120225505310980291226351653588799242142355376939447934804833830853036785704513557039806761305316841740131204576974408869765714675230132247412774215945663807730855436503625577606009921411947891570324777735323489304604987902364932089976811865007609745513534209603256719511305317200247134396733168695387708420206468160279271453425776388025425790010391137010735121696446552257334341187063
e = 65537
k = 1
while((((p-1)*(q-1)*k+1)) % e != 0):
    k += 1
d = ((p-1)*(q-1)*k+1)//e

dm = pow(c, d, n)
print(long_to_bytes(dm))
```

得到flag：`moectf{uLl_f1Nd_th@t_RsA_1s_1nte2eSt1nG}`

*啊，神秘的非对称加密*





<br/>

---

## easy木大定理

> 200points
>
> 听说欧拉定理是rsa的基础呢

附件中代码如下：

```python
from gmpy2 import *   <-- 注意：这个库我装载不了，官方也好像弃用了，于是我用了其他的库和函数来代替它 下同
from Crypto.Util.number import *
from flag import flag

def phi(p):
    count = 0
    for i in range(1 , p):
        if gcd(p , i) == 1:
            count += 1
    return count

def padding(m):
    lenth = 8 - len(m) % 8
    return m + chr(lenth).encode() * lenth

def enc_block(m , n , e):
    return pow(m ,e , n)


def enc(plain , nlist , e):
    m = padding(plain)
    c = []
    for i in range(len(m) // 8):
        c.append(enc_block(bytes_to_long(m[i*8:i*8+8]) , nlist[i%len(nlist)] , e))
    return c


def dec(clist , nlist , e):
    m = b''
    for i in range(len(clist)):
        m += long_to_bytes(pow(clist[i] , invert(e , phi(nlist[i%len(nlist)])) , nlist[i%len(nlist)]))
    return m

p = getPrime(128)
q = getPrime(128)
r = getPrime(128)
e = getPrime(64)
nlist = [p , q  , p*q , q*r ,  p*q*r , p*p , p*p*r , q*q*q*p*r , r]
print('p =' , p)
print('q =' , q)
print('r =' , r)
print('e =' , e)
print(enc(flag , nlist , e))


#p = 271025496017434332035320753340939587753
#q = 187062615477826075738455044071781085709
#r = 264397348115983548873673645475684815267
#e = 14436419940785226047
#[79782042635181913487761772413093921465, 107105488436932482013906334623869740338, 3509151100641734446618186842681522103526622068330460330390027482293268995394, 44354713639146606352347981311754502280362685562054139875438634255351381551517, 7171349658970005627908887988207921395623970773677857712592896110910571654197390635906137916220127293111749219597125, 58862655174446752862856422604624433087552362298932033062526721301095820867360, 3090488671394364096763874366619864017834796691989365240435579932872211345861700323240994096818599239942176113337679, 53242497022725707314805904569598522652513669651433432760834670648465562534867455830168023766511087312372214790085176655801545624726261017112578045706948404488664028834533439478580770424859450, 81020119172085603626908922002571725744]

```

题目给出了 `dec(clist , nlist , e)` 的解密算法，但是运行起来特别慢，很难在短时间内得到结果，且主要耗时在`phi(p)`上，即计算1~p内与p互质数的个数，考虑优化这个算法。

根据题目的提示“欧拉定理”，查到相应的知识如下：

> **欧拉定理：**
>
> 在[数论](https://baike.baidu.com/item/数论)中，**欧拉定理,**（也称[**费马**](https://baike.baidu.com/item/费马)**-欧拉定理**）是一个关于同余的性质。欧拉定理表明，若n,a为[正整数](https://baike.baidu.com/item/正整数)，且n,a[互质](https://baike.baidu.com/item/互质)，则:
>
> 
>
> ![img](https://bkimg.cdn.bcebos.com/formula/3da31f29a8615a130216bdf28ccf3321.svg)
>
> **欧拉函数：**
>
> 通式：
>
> ![img](https://bkimg.cdn.bcebos.com/formula/ba40ed514646510df8a1033ff30701aa.svg)
>
>  (其中p1, p2……pn为x的所有[质因数](https://baike.baidu.com/item/质因数/6192269)，x是不为0的整数)
>
> 定义 φ(1)=1（和1[互质](https://baike.baidu.com/item/互质)的数(小于等于1)就是1本身）。
>
> 注意：每种质因数只有一个。
>
> 若n是质数p的k次幂，
>
> ![img](https://bkimg.cdn.bcebos.com/formula/b843a8b241f76d7068e96630fc384bb9.svg)
>
> ，因为除了p的倍数外，其他数都跟n互质。
>
> 比如12=2*2*3那么φ（12）=φ（4*3）=φ（2^2*3^1）=（2^2-2^1）*（3^1-3^0）=4
>
> 设n为正整数，以 φ(n)表示不超过n且与n互素的正整数的个数，称为n的欧拉函数值
>
> φ：N→N，n→φ(n)称为欧拉函数。
>
> 欧拉函数是[积性函数](https://baike.baidu.com/item/积性函数)——若m,n互质，
>
> ![img](https://bkimg.cdn.bcebos.com/formula/312031d1a76fa578eb4ef166530937fa.svg)
>
> 特殊性质：当n为奇质数时，
>
> ![img](https://bkimg.cdn.bcebos.com/formula/5047f2bc6e623027b7707e6c51adc92f.svg)
>
> , 证明与上述类似。
>
> 若n为质数则
>
> ![img](https://bkimg.cdn.bcebos.com/formula/25e9558d577009b1b8b56f9a103b2321.svg)



这样就可以优化`phi(p)`，写出更快的`phi2(p)`如下：

```python
from Crypto.Util.number import *
import numpy as np


def get_(a, b):# 改进欧几里得算法求线性方程的x与y
    if b == 0:
        return 1, 0
    else:
        k = a // b
        remainder = a % b
        x1, y1 = get_(b, remainder)
        x, y = y1, x1 - k * y1
    return x, y
def invert(a,b): 
    # 将初始b的绝对值进行保存
    if b < 0:
        m = abs(b)
    else:
        m = b
    flag = np.gcd(a, b)
    # 判断最大公约数是否为1，若不是则没有逆元
    if flag == 1:
        x, y = get_(a, b)
        return x % m  # 对于Python '%'就是求模运算，因此不需要'+m'

def invert2(a,b): 
    m = 2
    while(np.gcd(a,m)!=1):
        m += 1
    return (a//b)%m

def invert3(a,m):#这个扩展欧几里得算法求模逆

    if np.gcd(a,m)!=1:
        return None
    u1,u2,u3 = 1,0,a
    v1,v2,v3 = 0,1,m
    while v3!=0:
        q = u3//v3
        v1,v2,v3,u1,u2,u3 = (u1-q*v1),(u2-q*v2),(u3-q*v3),v1,v2,v3
    return u1%m

def phi(p):
    count = 0
    print(p)
    for i in range(1, p):
        if np.gcd(p, i) == 1:
            count += 1
    return count


def padding(m):
    lenth = 8 - len(m) % 8
    return m + chr(lenth).encode() * lenth


def enc_block(m, n, e):
    return pow(m, e, n)


def enc(plain, nlist, e):
    m = padding(plain)
    c = []
    for i in range(len(m) // 8):
        c.append(enc_block(bytes_to_long(
            m[i*8:i*8+8]), nlist[i % len(nlist)], e))
    return c


def phi2(i):
    if (i == 0):
        return p-1
    elif (i == 1):
        return q-1
    elif (i == 2):
        return (p-1)*(q-1)
    elif (i == 3):
        return (q-1)*(r-1)
    elif (i == 4):
        return (q-1)*(r-1)*(p-1)
    elif (i == 5):
        return (p-1)*(p)
    elif (i == 6):
        return (p-1)*(p)*(r-1)
    elif (i == 7):
        return (q-1)*(q)*(q)*(p-1)*(r-1)
    elif (i == 8):
        return r-1


def dec(clist, nlist, e):
    m = b''
    for i in range(len(clist)):

        m += long_to_bytes(pow(clist[i], invert3(e,phi2(i % len(nlist))), nlist[i % len(nlist)]))
        
    return m


# p = getPrime(128)
# q = getPrime(128)
# r = getPrime(128)
# e = getPrime(64)
p = 271025496017434332035320753340939587753
q = 187062615477826075738455044071781085709
r = 264397348115983548873673645475684815267
e = 14436419940785226047
nlist = [p, q, p*q, q*r,  p*q*r, p*p, p*p*r, q*q*q*p*r, r]
print('p =', p)
print('q =', q)
print('r =', r)
print('e =', e)

c = [79782042635181913487761772413093921465, 107105488436932482013906334623869740338, 3509151100641734446618186842681522103526622068330460330390027482293268995394, 44354713639146606352347981311754502280362685562054139875438634255351381551517, 7171349658970005627908887988207921395623970773677857712592896110910571654197390635906137916220127293111749219597125,
     58862655174446752862856422604624433087552362298932033062526721301095820867360, 3090488671394364096763874366619864017834796691989365240435579932872211345861700323240994096818599239942176113337679, 53242497022725707314805904569598522652513669651433432760834670648465562534867455830168023766511087312372214790085176655801545624726261017112578045706948404488664028834533439478580770424859450, 81020119172085603626908922002571725744]
print(dec(c, nlist, e))

```

- [ ] 注：`gmpy2`库不知道什么原因我装载不了，官方也好像弃用了，于是我用了`Crypto.Util.number`、`numpy`来代替它，然而`invert`好像还是没有，就搞了一个轮子……求助有没有更好的解决方法。

运行得到flag：`moectf{EULEREu1erEule2Eu1erEulerEyoulerEU1e2Mud@MuDaMudamuDaMudaMUDA}`



> 欧拉欧拉欧拉欧拉欧拉欧拉欧拉木大木大木大！

- [ ]   为什么木大呢🤔


<br/>

---

后面的题就没有做了

<br/>

---



*未完并不一定待续……*