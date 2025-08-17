---
title: 【信号与系统 x MATLAB】实验三
date: 2021-5-21
categories:
  - 理学
tags:
  - 信号与系统
  - 作业
  - MATLAB
abbrlink: 32997
---

# 【信号与系统 x MATLAB】实验三

  **实验摘要：**  

用 MATLAB 进行信号与系统课程第三次实验  

主要内容有：

- 图片的高频信息与低频信息（合成、分解图片）
- 频域制作数字盲水印和去除数字盲水印  
- 傅里叶变换、傅里叶逆变换与其时移特性

<!--more-->



**实验题目**  

* 图片的高频信息与低频信息合成图片。  

**合成图片。**找两张轮廓比较像的图片 A 和 B，有一张是你本人。提取一张照片的低频信息，另一张图片的高频信息，结合这两个照片。设置不同的频率门限，组合照片，组合的效果是，放大看是 A，缩小看是 B。例如以下两张图片    

**分解图片**。把下图爱因斯坦和玛丽莲梦露分开（此图缩小是玛丽莲梦露，截取不同的频段）   

![image-20210524010515937](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735.png)

* **频域**制作**数字盲水印和去除数字盲水印** https://www.zhihu.com/question/50735753，看懂，想想，有想法写出来，做一个好玩的东西。                                                                            

* 傅里叶变换两题

<div>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,IE=9,chrome=1"><meta name="generator" content="MATLAB 2020b"><title>使用 2 维离散余弦变换（DCT）分解合成图像的高频和低频</title><style type="text/css">.rtcContent { padding: 30px; } .S0 { margin: 3px 10px 5px 4px; padding: 0px; line-height: 28.8px; min-height: 0px; white-space: pre-wrap; color: rgb(213, 80, 0); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-size: 24px; font-weight: 400; text-align: left;  }
.CodeBlock { background-color: #F7F7F7; margin: 10px 0 10px 0;}
.S1 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0.994318px solid rgb(233, 233, 233); border-bottom: 0.994318px solid rgb(233, 233, 233); border-radius: 4px; padding: 6px 45px 4px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S2 { margin: 3px 10px 5px 4px; padding: 0px; line-height: 20px; min-height: 0px; white-space: pre-wrap; color: rgb(60, 60, 60); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-size: 20px; font-weight: 700; text-align: left;  }
.S3 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0.994318px solid rgb(233, 233, 233); border-bottom: 0px none rgb(0, 0, 0); border-radius: 4px 4px 0px 0px; padding: 6px 45px 0px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S4 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0px none rgb(0, 0, 0); border-bottom: 0px none rgb(0, 0, 0); border-radius: 0px; padding: 0px 45px 0px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S5 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0px none rgb(0, 0, 0); border-bottom: 0.994318px solid rgb(233, 233, 233); border-radius: 0px 0px 4px 4px; padding: 0px 45px 4px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S6 { margin: 10px 10px 9px 4px; padding: 0px; line-height: 21px; min-height: 0px; white-space: pre-wrap; color: rgb(0, 0, 0); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-size: 14px; font-weight: 400; text-align: left;  }
.S7 { margin: 2px 10px 9px 4px; padding: 0px; line-height: 21px; min-height: 0px; white-space: pre-wrap; color: rgb(0, 0, 0); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-size: 14px; font-weight: 400; text-align: left;  }</style></head><body><div class = rtcContent><h1  class = 'S0'><span>使用 2 维离散余弦变换（DCT）分解合成图像的高频和低频</span></h1><div class="CodeBlock"><div class="inlineWrapper"><div  class = 'S1'><span style="white-space: pre;"><span>clear</span></span></div></div></div><h2  class = 'S2'><span>合成图像</span></h2><div class="CodeBlock"><div class="inlineWrapper"><div  class = 'S3'><span style="white-space: pre;"><span>RGB1 = imread(</span><span style="color: rgb(170, 4, 249);">"doge_young.png"</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>I1 = im2gray(RGB1);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>RGB2 = imread(</span><span style="color: rgb(170, 4, 249);">"doge_old.png"</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>I2 = im2gray(RGB2);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 使用 dct2 对灰度图像执行 2-D DCT</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J1 = dct2(I1);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J2 = dct2(I2);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 高低频分界线</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>d = </span></span><span>260</span><span style="white-space: pre;"><span>;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 去除低频</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_high = J1;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_high(abs(J1) &gt; d) = 0;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 去除高频</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_low = J2;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_low(abs(J2) &lt;= d) = 0;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 使用逆 DCT 函数 idct2 重建图像</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>K = idct2(J_low+J_high);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>K = rescale(K);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 显示图像</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>montage({I1,I2})</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>title(</span><span style="color: rgb(170, 4, 249);">'原始图像'</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>montage({K})</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>title(</span><span style="color: rgb(170, 4, 249);">'合并图像'</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S5'><span style="white-space: pre;"><span>imwrite(K,</span><span style="color: rgb(170, 4, 249);">"such.png"</span><span>)</span></span></div></div></div><h2  class = 'S2'><span>分解图像</span></h2><div class="CodeBlock"><div class="inlineWrapper"><div  class = 'S3'><span style="white-space: pre;"><span>RGB = imread(</span><span style="color: rgb(170, 4, 249);">'m_a.png'</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>I = im2gray(RGB);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 使用 dct2 对灰度图像执行 2-D DCT</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J = dct2(I);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 使用对数标度显示变换后的图像</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 注意到大部分能量位于左上角</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>imshow(log(abs(J)),[])</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>colormap </span><span style="color: rgb(170, 4, 249);">parula</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>colorbar</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 高低频分界线</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>d = </span></span><span>340</span><span style="white-space: pre;"><span>;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 去除高频</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_low = J;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_low(abs(J) &lt;= d) = 0;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 去除低频</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_high = J;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>J_high(abs(J) &gt; d) = 0;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 使用逆 DCT 函数 idct2 重建图像</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>K_low = idct2(J_low);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>K_low = rescale(K_low);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>K_high = idct2(J_high);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>K_high = rescale(K_high);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 并排显示图像</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>montage({K_low,K_high})</span></span></div></div><div class="inlineWrapper"><div  class = 'S5'><span style="white-space: pre;"><span>title(</span><span style="color: rgb(170, 4, 249);">'低频图像/高频图像'</span><span>);</span></span></div></div></div><div  class = 'S6'><span style=' font-style: italic;'>参考：MATLAB 帮助文档例程：</span><span>Remove High Frequencies in Image using 2-D DCT</span></div><div  class = 'S7'></div></div>
<br>

**输出**

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-1.png)





![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-2.png)





![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-3.png)





![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-4.png)





<div>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,IE=9,chrome=1"><meta name="generator" content="MATLAB 2020b"><title>给上一题的图片加上盲水印</title><style type="text/css">.rtcContent { padding: 30px; } .S0 { margin: 3px 10px 5px 4px; padding: 0px; line-height: 28.8px; min-height: 0px; white-space: pre-wrap; color: rgb(213, 80, 0); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-size: 24px; font-weight: 400; text-align: left;  }
.S1 { margin: 2px 10px 9px 4px; padding: 0px; line-height: 21px; min-height: 0px; white-space: pre-wrap; color: rgb(0, 0, 0); font-family: Helvetica, Arial, sans-serif; font-style: normal; font-size: 14px; font-weight: 400; text-align: left;  }
.CodeBlock { background-color: #F7F7F7; margin: 10px 0 10px 0;}
.S2 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0.994318px solid rgb(233, 233, 233); border-bottom: 0.994318px solid rgb(233, 233, 233); border-radius: 4px; padding: 6px 45px 4px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S3 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0.994318px solid rgb(233, 233, 233); border-bottom: 0px none rgb(0, 0, 0); border-radius: 4px 4px 0px 0px; padding: 6px 45px 0px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S4 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0px none rgb(0, 0, 0); border-bottom: 0px none rgb(0, 0, 0); border-radius: 0px; padding: 0px 45px 0px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }
.S5 { border-left: 0.994318px solid rgb(233, 233, 233); border-right: 0.994318px solid rgb(233, 233, 233); border-top: 0px none rgb(0, 0, 0); border-bottom: 0.994318px solid rgb(233, 233, 233); border-radius: 0px 0px 4px 4px; padding: 0px 45px 4px 13px; line-height: 17.234px; min-height: 18px; white-space: nowrap; color: rgb(0, 0, 0); font-family: Menlo, Monaco, Consolas, "Courier New", monospace; font-size: 14px;  }</style></head><body><div class = rtcContent><h1  class = 'S0'><span>给上一题的图片加上盲水印</span></h1><div  class = 'S1'><span>以下的</span><span>MATLAB</span><span>实现的一个极其简单的盲水印</span><span>demo</span><span>：</span></div><div class="CodeBlock"><div class="inlineWrapper"><div  class = 'S2'><span style="white-space: pre;"><span>clear</span></span></div></div></div><div class="CodeBlock"><div class="inlineWrapper"><div  class = 'S3'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 加水印</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>img = double(imread(</span><span style="color: rgb(170, 4, 249);">"such.png"</span><span>));</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>wm = double(imread(</span><span style="color: rgb(170, 4, 249);">"blind.png"</span><span>));</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>imshow(wm);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>title(</span><span style="color: rgb(170, 4, 249);">'水印图像'</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>d = 5; </span><span style="color: rgb(2, 128, 9);">% 水印深度</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>fimgre = fft2(img) + wm*d;</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>imgre = uint8(real(ifft2(fimgre)));</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 并排显示加水印前后图像</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>montage({uint8(img),imgre})</span></span></div></div><div class="inlineWrapper"><div  class = 'S5'><span style="white-space: pre;"><span>title(</span><span style="color: rgb(170, 4, 249);">'原始图像/加入水印后的图像'</span><span>);</span></span></div></div></div><div class="CodeBlock"><div class="inlineWrapper"><div  class = 'S3'><span style="white-space: pre;"><span style="color: rgb(2, 128, 9);">% 解水印</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>wm = fft2(imgre) - fft2(img);</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>imshow(mat2gray(real(wm)/d));</span></span></div></div><div class="inlineWrapper"><div  class = 'S4'><span style="white-space: pre;"><span>title(</span><span style="color: rgb(170, 4, 249);">'解出水印'</span><span>);</span></span></div></div><div class="inlineWrapper"><div  class = 'S5'></div></div></div></div>
<br>
</div>

**输出**

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-5.png)





![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-6.png)





![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-7.png)

## 傅里叶变换

![image-20210524003436425](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-8.png)

![image-20210524003441538](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-9.png)

因为涉及到符号计算，于是直接上 Mathematica 写了： 

 Mathematica 代码：  

$\text{FourierTransform}\left[e^{-2 | t| },t,\omega ,\text{FourierParameters}\to \{1,-1\}\right]$

$\text{InverseFourierTransform}\left[\frac{1}{\omega ^2+1},\omega ,t,\text{FourierParameters}\to \{1,-1\}\right]$

$\text{FourierTransform}\left[\frac{1}{2} e^{-2 t} \theta (t),t,\omega ,\text{FourierParameters}\to \{1,-1\}\right]$

$Plot[{Norm[-(I/(2 (-2 I + \[Omega])))], 
  Arg[-(I/(2 (-2 I + \[Omega])))]}, {\[Omega], -4.2`, 4.2`}, 
 PlotRange -> {-4, 4}]$

$FourierTransform[E^(-2*(t - 1))/2*HeavisideTheta[t - 1], t, \[Omega], 
 FourierParameters -> {1, -1}]$

$\text{Plot}\left[\left\{\left\| -\frac{i \cos (\omega )+\sin (\omega )}{2 (-2 i+\omega )}\right\| ,\arg \left(-\frac{\sin (\omega )+i \cos (\omega )}{2 (\omega -2 i)}\right)\right\},\{\omega ,-4.2,4.2\},\text{PlotRange}\to \{-4,4\}\right]$

输出：

![image-20210524005324141](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-10.png)



后来有同学问我 MATLAB 怎么写，于是用 MATLAB 又写了一遍~~（MATLAB 符号计算居然也能用，但依然大大不如 Mathematica）~~



```matlab
clear
syms t w

f = exp(-2*abs(t));
fourier(f)

F = 1/(1+w^2);
ifourier(F)

T = -5:0.1:5;
f1 = exp(-2*t)/2*heaviside(t);
fFwl = matlabFunction(fourier(f1))

plot(T,abs(fFwl(T)),'.')
hold on 
plot(T,angle(fFwl(T)),'.')

% 时域移动t-1
f1 = exp(-2*(t-1))/2*heaviside(t-1);
fFwl = matlabFunction(fourier(f1))

plot(T,abs(fFwl(T)))
plot(T,angle(fFwl(T)))
hold off

grid on
```

部分输出：

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-11.png)

 

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-12.png)



![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-13.png)



```
fFwl = 包含以下值的 function_handle:
    @(w)1.0./(w.*2.0i+4.0)
```



![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-14.png)



```
fFwl = 包含以下值的 function_handle:
    @(w)exp(w.*-1i)./(w.*2.0i+4.0)
```

![img](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815203735-15.png)

这个可以看出傅里叶变换的时移特性：能量没变，相位变化了。