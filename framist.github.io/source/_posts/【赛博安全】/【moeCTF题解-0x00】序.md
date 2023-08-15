---
title: 【moeCTF题解-0x00】序
categories: 
- 计算机科学
- 网络安全
- CTF
- moeCTF
tags: 
- CTF
---

# 【moeCTF题解-0x00】序

本题解会同步发布在 [CSDN](https://blog.csdn.net/weixin_47102975) 中，不过更新会比这里慢一点。这里的评论功能还没有建设好，可以先去那里~

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



 ![moectf](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210527.png)





## 比赛介绍

> MoeCTF是西安电子科技大学一年一度的信息安全新生夺旗赛, 由西电信息安全协会面向全体准大学生举办, 题目难度不高且坡度平缓, 比赛平台开设时间很长, 0基础新生可以通过本次比赛对信息安全夺旗赛(CTF)有一个基础且全面的认识, 中学参加过一些CTF比赛的准大学生们也可以通过本次比赛重温CTF赛事.
>
> MoeCTF除了设有常规CTF比赛相关的分类之外也开设或有计划开设了算法编程类, 运维类, 旨在提供一个知识覆盖全面的做题环境, 同时帮助有过信息学竞赛经历的新生们更快转型.
>
> MoeCTF的积分方式为最简单的静态积分方式, 选手解题并获取固定的分数, 不设动态积分, 不设一血加成, 选手即使在比赛进行时参赛也不必担心分数差距. 部分题目出题人可能提供题目奖励, 比赛本身无奖项. 比赛结束后平台会继续维护一周供各位选手复盘, 写题解. 西电新生们比赛结束后可能会要求提交题解, 作为西电信息安全协会(XDSEC)2020秋季招新的一个重要砝码. 欢迎大家前来参加比赛, 与各路极客同台竞技, 也欢迎新生们在比赛结束后加入XDSEC, 分享技术, 共同进步!
>
> 西电信息安全协会(XDSEC)是由08, 09级学长自发组建的学生组织, 面向全校各年级同学 ,期间多次与学校合作, 自行管理和发展至今. 协会资源丰富, 在信息安全领域口碑十分优秀. 协会以致力于技术分享与进步为宗旨, 秉承低调, 分享, 专注, 精进, 自由的精神, 旨在为我校热爱信息安全技术的同学建立一个氛围良好的交流平台, 扩大信息安全在我校的影响力.

<!--more-->

我本是空间院的摸鱼佬，毫无准备地转到了网安专业。虽然实验班的机试让我初窥了CTF的世界，但moeCTF才是真正的入门之旅，感谢大佬师傅们的教程式渐进题目，让我学到了好多好多。啊，现在我已经不是萌新惹。作为大二的老生参与moe，还是挺羞耻呢 (〃ﾉωﾉ) 

![image-20201009234611739](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210527-1.png)

> Awards
>
> ​									 								
>  ​								**Hint 1** 							
>
> hints
>
> Hint for Baby pwn
>
> -1
>
> ​									 								
>  ​								**Hint 71** 							
>
> hints
>
> Hint for 简  单 的社工题
>
> -10
>
> ​									 								
>  ​								**Hint 72** 							
>
> hints
>
> Hint for 简  单 的社工题
>
> -25
>
> ​									 								
>  ​								**Hint 4** 							
>
> hints
>
> Hint for Show off
>
> -1
>
> ​									 								
>  ​								**Hint 54** 							
>
> hints
>
> Hint for 两只企鹅
>
> -50
>
> ​									 								
>  ​								**Hint 21** 							
>
> hints
>
> Hint for 赤道企鹅, 永远滴神
>
> -50

感觉自己目前对Misc部分最擅长，这部分也最有趣啦，（可能因为以前也都是野路子叭，只自己捣鼓电脑，学得杂而不精），其他方向感觉仍在门外需慢慢学习……

毕竟做题追求分数，有些题做出来了还不甚清楚原理，也可在这次写题解的过程中慢慢梳理。

本WP仅供参考，希望大家一起交流进步

<br/>



![小乖](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815210527-2.png)

<br/>

## link：其他师傅的题解

* [记moectf2020新生赛 及 部分MISC题WP](https://blog.csdn.net/qq_45819626/article/details/108961826)

* arttnba3：[【CTF题解-0x03】moeCTF2020-partial official write up by arttnb3](https://arttnba3.cn/2020/09/07/%E3%80%90CTF%E9%A2%98%E8%A7%A3-0x03%E3%80%91moeCTF2020-write-up-by-arttnb3/#more)

* BlackBird：[blackbird-bb.github.io](https://blackbird-bb.github.io/)

* Dawn_whisper： https://dawnwhisper.github.io/

* 吉吉： https://zhuanlan.zhihu.com/p/262761814

* Noahtie - Reverse Pwn Algorithm Crypto Classic-Crypto Misc Web Android：https://noahtie.github.io/2020/10/12/MoeCTF2020/


<br/>

# 【moeCTF题解-0x00】Sing in

2/2

## 签到

> 100points
>
> **参加比赛前置条件** 						 					
>
> 证明你来过~ 
>
> `flag`请见官方比赛群(`QQ:1102180069`)公告. 
>
> 参加比赛前请先阅读`赛事群公告`, 与平台上方`Notifications`分区所发布的几个公告. 祝比赛愉快!

flag：`moectf{W3lc0me_t0_MoeCTF!}`



<br/>

## 招新群

> 进入招新群的同学们可以等待面试通知了
>
>  flag在群内公告哦 

flag：`moectf{Inn3r_W0rld}`