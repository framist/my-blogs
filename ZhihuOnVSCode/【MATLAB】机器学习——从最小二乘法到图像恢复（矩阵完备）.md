#! https://zhuanlan.zhihu.com/p/365701435

![图](https://img-blog.csdnimg.cn/20200722193618283.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)



# 【MATLAB】机器学习——从最小二乘法到图像恢复（矩阵完备）

>  本文原为《机器学习——从最小二乘开始》课程的作业
> 
> 本文同步发布于[CSDN](https://editor.csdn.net/md/?articleId=107521149)与[个人博客](framist.github.io)

## 1、等值线

### 题目

结合Matlab环境的contour函数研究二元函数的等值线变化规律

你能用这些发现做什么？给出具体分析、例证

### 描述

平面上任取4个点x1 、 x2 、 x3 、 x4。研究含有参数 的二元函数：
$$
f(x) = \sum^{4}_{i=1}{\theta_ie^{-\gamma||x-x_i||^2}}
$$
的等值的变化规律，其中参数𝜃𝑖为实数，𝛾为正实数。 

### 提示

- 至少要考虑相邻两点对应的𝜃𝑖同号和异号的情况； 
- 各个参数变化等值线的变化规律；
- 突出0等值线；
- 最后总结出一般规律；
- 最后推广到多于4个点，甚至1000个点！ 

### 解答

原始参数：

```matlab
x_i = [1 1 ; 1 -1 ; -1 -1; -1 1 ]';
theta = [1 1 -1 -1];
gamma = 0.5;
X = -2:0.01:2;
Y = X;
```



#### 相邻两点𝜃𝑖异号

`theta = [1 -1 1 -1];`

![图](https://img-blog.csdnimg.cn/20200722193118384.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


#### 相邻两点𝜃𝑖同号

` theta = [1 1 -1 -1] `

![图](https://img-blog.csdnimg.cn/20200722193132552.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


#### 改变γ

`gamma = 1`

![图](https://img-blog.csdnimg.cn/20200722193139481.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


`gamma = 0.25`

![图](https://img-blog.csdnimg.cn/20200722193146920.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


#### 改变x_i

` x_i = [1 1 ; 1.5 -1 ; -1.5 -1; -1 1 ]' `

![图](https://img-blog.csdnimg.cn/20200722193205396.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


#### 推广到多于4个点

```matlab
x_i = [1 1 ; 1 -1 ; -1 -1; -1 1 ; 0 0]';
theta = [1 -1 1 -1 1];
```

![图](https://img-blog.csdnimg.cn/20200722193223225.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


```matlab
x_i = [1 1 ; 1 -1 ; -1 -1; -1 1 ; 0 0 ; 0 1]';
theta = [1 -1 1 -1 1 -1];
```

![图](https://img-blog.csdnimg.cn/2020072219323216.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


#### 总结出一般规律

二元函数：
$$
f(x) = \sum^{n}_{i=1}{\theta_ie^{-\gamma||x-x_i||^2}}
$$
可用于分类平面上的点集，θ的符号正负即两类点集，

但有些比较复杂但组合会出现误差。

#### 附：代码

```matlab
% 等值线
clc;
clear;
x_i = [1 1 ; 1 -1 ; -1 -1; -1 1 ]';
theta = [1 -1 1 -1 ];
gamma = 0.5;
X = -2:0.01:2;
Y = X;
Z = zeros(length(X),length(Y));
for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = f(X(i) , Y(j) , theta , gamma , x_i );
    end
end

[X,Y] = meshgrid(X,Y);
% M = [];

contour(X,Y,Z,'ShowText','on')
colorbar
hold on
for i = 1:length(x_i)
    plot(x_i(1,i),x_i(2,i),'.')
end


function z = f(x , y , theta , gamma , x_i )
    z = 0;
    for i = 1:length(x_i)
        z = z + theta(i) * exp(-gamma .* norm([x;y] - x_i(:,i)));
    end
    return;
end

```



## 2、用最小二乘法分开不同颜色的数据



使用分类器：
$$
f(x) = \sum^{n}_{i=1}{\theta_ie^{-\gamma||x-x_i||^2}}
$$

### 点集生成

![图](https://img-blog.csdnimg.cn/20200722193401151.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)



```matlab
% 点集生成
clc
clear
n = 200;
dot_1 = rand(2,50);
dot_1 = [dot_1,  rand(2,50)- ones(2,50)];
dot_2 = rand(2,50) + [zeros(1,50) ; -ones(1,50)];
dot_2 = [dot_2,  rand(2,50) -  [ones(1,50) ; -zeros(1,50)]];
hold on

scatter(dot_1(1,:),dot_1(2,:),'blue')
dot_1(3,:) = -ones(1,100);
scatter(dot_2(1,:),dot_2(2,:),'red')
dot_2(3,:) = ones(1,100);

dot_s = [dot_1 , dot_2];
```

### 分类

![图](https://img-blog.csdnimg.cn/20200722193335110.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


```matlab
% 非线性最小二乘法

fun = @(x0)f_lsq(x0 , dot_s );
x0 = rand(n+1,1);
x = lsqnonlin(fun,x0);


gamma = x(end);
theta = x(1:end-1);
X = -2:0.01:2;
Y = X;
Z = zeros(length(X),length(Y));
for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = f(X(i) , Y(j) , theta , gamma, dot_s(1:2,:) );
    end
end

[X,Y] = meshgrid(X,Y);

contour(X,Y,Z,'ShowText','on')
colorbar
hold off

function z = f(x , y , theta , gamma , x_i )
    z = 0;
    for i = 1:length(x_i)
        z = z + theta(i) .* exp(-gamma .* norm([x;y] - x_i(:,i)));
    end
    return;
end

function z = f_lsq(x0 , dot_s )
    gamma = x0(end);
    theta = x0(1:end-1);
    z = zeros(1,length(dot_s));
    for i = 1:length(dot_s)
        z(i) = f(dot_s(1,i) , dot_s(2,i) , theta , gamma , dot_s(1:2,:) ) - dot_s(3,i);
    end
    
end
```





## 3、矩阵完备化的最小二乘法

### 3.1 矩阵恢复

同学甲给同学乙出题：甲随机方法生成一个较大的低秩矩阵(怎么保证低秩？)，然后随机去掉里面大部分元素，提供给乙，乙用最小 二乘法恢复，比较结果异同！(甲乙角色互换下) 



#### 生成不完备矩阵代码

```matlab
clear,clc;
m = 10;
n = 12;
r = 2;
p = 50; % 剩余元素个数 <1/2
B = randi(10,m,r);
C = randi(10,r,n);
A = B * C
a = A(:);
I = randperm(length(a));
a(I(p+1:end)) = inf;
Abar = reshape(a,m,n)
```

#### 恢复代码

```matlab
% A为mxn，B为mxr, C为rxn
r = 2; % 猜测r
x0 = randi(10,m+n,r);
% 非线性最小二乘法
fun = @(x)fmatrix( x, m , n  ,Abar);
x = lsqnonlin(fun,x0);

AbarRecover =round( x(1:m ,:) * x(m+1:n+m ,:)')
Abar(Abar == Inf) = AbarRecover(Abar == Inf)

function y = fmatrix(x, m , n  , Abar)
y = Abar - x(1:m ,:) * x(m+1:n+m ,:)';
y(y == inf) = 0;
end
```

#### 输出示例

* 原始矩阵（部分）

```matlab
A = 10×12
   209   190   212   151   168   197   157   144   124   157   161   147
   196   174   161   137   139   146   137   112   111   119   171   140
   243   222   213   129   166   200   206   130   144   163   172   161
   173   165   155   105   135   147   126   102   115    91   138   135
   193   170   172   179   178   171   115   136   125   126   188   164
   112   102    92    86   110   106    82    68    87    69    97   103
   254   225   199   187   192   189   171   144   153   146   232   195
   221   194   196   133   134   167   177   124   108   161   167   129
   171   143   150    96   106   141   163    90    84   158   111    91
   175   172   157    86   133   151   138    96   122    85   127   136
```

* 随机去值（部分）

```matlab
Abar = 10×12
   Inf   Inf   212   151   Inf   Inf   157   144   Inf   Inf   161   Inf
   196   Inf   161   Inf   Inf   146   137   112   111   Inf   171   Inf
   Inf   222   Inf   129   Inf   200   Inf   Inf   Inf   163   Inf   Inf
   173   165   155   Inf   Inf   Inf   Inf   102   115   Inf   138   135
   Inf   Inf   172   179   178   171   Inf   136   125   Inf   Inf   164
   Inf   Inf    92   Inf   Inf   Inf    82   Inf    87    69   Inf   103
   Inf   Inf   Inf   Inf   192   Inf   171   144   Inf   Inf   Inf   Inf
   Inf   Inf   196   Inf   Inf   Inf   Inf   Inf   Inf   161   Inf   Inf
   Inf   Inf   150   Inf   Inf   141   Inf    90    84   158   111   Inf
   Inf   Inf   Inf   Inf   133   Inf   Inf    96   122   Inf   127   Inf
```

* 拟合低秩矩阵（部分）

```matlab
AbarRecover = 10×12
   206   231   212   151   154   196   157   144   104   205   161   161
   196   185   161   179   151   146   137   112   111   153   171   152
   172   222   176   129   139   200   133   143   103   163   170   132
   173   165   155   112   146   140   104   102   115    90   138   135
   201   214   172   179   178   171   137   136   125   144   202   164
   134   107    92   127   108    80    82    63    87    69   120   103
   258   240   194   225   192   211   171   144   172   157   238   183
   231   204   196   173   160   177   155   119   137   161   167   166
   165   156   150   128    95   141   127    90    84   158   111   112
   207   170   179   138   133   152   136    96   122   138   127   144
```

* 还原矩阵（部分）

```matlab
Abar = 10×12
   206   231   212   151   154   196   157   144   104   205   161   161
   196   185   161   179   151   146   137   112   111   153   171   152
   172   222   176   129   139   200   133   143   103   163   170   132
   173   165   155   112   146   140   104   102   115    90   138   135
   201   214   172   179   178   171   137   136   125   144   202   164
   134   107    92   127   108    80    82    63    87    69   120   103
   258   240   194   225   192   211   171   144   172   157   238   183
   231   204   196   173   160   177   155   119   137   161   167   166
   165   156   150   128    95   141   127    90    84   158   111   112
   207   170   179   138   133   152   136    96   122   138   127   144
```

### 3.2 图像恢复

 选择灰度图象(其实就是一个矩阵)，生成一些 遮挡块，尝试恢复图象，和原图对比！

#### 示例

先以Lenna图为例：

* 原始图像：

![图](https://img-blog.csdnimg.cn/20200722193546182.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


```
原图秩：128
```

* 随机去值：

![图](https://img-blog.csdnimg.cn/20200722193554512.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


```MATLAB
r = 10; % 猜测r
```

* 拟合低秩矩阵：

![图](https://img-blog.csdnimg.cn/20200722193605656.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


* 还原图像：

![图](https://img-blog.csdnimg.cn/20200722193618283.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NzEwMjk3NQ==,size_16,color_FFFFFF,t_70)


---



以下皆按以上顺序排列：

![图](https://img-blog.csdnimg.cn/20200722194820734.png)
![图](https://img-blog.csdnimg.cn/20200722194826413.png)
![图](https://img-blog.csdnimg.cn/20200722194834367.png)
![图](https://img-blog.csdnimg.cn/2020072219484120.png)

-----

![图](https://img-blog.csdnimg.cn/2020072219491914.png)

![图](https://img-blog.csdnimg.cn/20200722194925492.png)
![图](https://img-blog.csdnimg.cn/20200722194931752.png)

![图](https://img-blog.csdnimg.cn/20200722194938970.png)

-------



恢复彩色图像同理，只需依次把三个通道恢复再合并

#### 代码

```matlab
clear,clc;

A = double( imread('Lenna.png'));
A = A(:,:,2);
imshow(A,[0,255])
disp('原图秩：')
rank(A)
[m , n] = size(A);
p = 10000;
a = A(:);
I = randperm(length(a));
a(I(p+1:end)) = inf;
A = reshape(a,m,n);

imshow(A,[0,255]);

% A为mxn，B为mxr, C为rxn
r = 10; % 猜测r
x0 = randi(16,m+n,r);
% 非线性最小二乘法
fun = @(x)f_matrix( x, m , n ,A);
x = lsqnonlin(fun,x0);

ARecover = round( x(1:m ,:) * x(m+1:n+m ,:)');


A(A == Inf) = ARecover(A == Inf);
imshow(ARecover,[0,255])
imshow(A,[0,255])

function y = f_matrix(x, m , n ,Abar)
y = Abar - x(1:m ,:) * x(m+1:n+m ,:)';
y(y == inf) = 0;
end
```

#### 疑问

恢复图像是假设图像是低秩矩阵，但确实是这样吗，若则为什么是这样呢？

## 4、拓展实验——LIBSVM应用练习

详细下载/学习网址:

 https://www.csie.ntu.edu.tw/~cjlin/libsvm/ 

练习数据：

 https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/ 

 http://archive.ics.uci.edu/ml/index.php  

选择相关数据，自己做 实验后查阅文献对比试验效果；修改各参数观测、总结结果随参数的变化情况。

至少进行 MNIST / ADULT / USPS / Abalone 数据的相关实验和经典文献结果对比



### Abalone

```matlab
%% LIBSVM
% 下载安装可参考：
% https://blog.csdn.net/github_35807147/article/details/80725642
% https://blog.csdn.net/qq_31781741/article/details/82666861

[lable,im]=libsvmread('abalone.txt');                              %读取文件
model=svmtrain(lable(1:300),im(1:300,:),'-s 4 -t 2 -c 1 -g 0.125');%训练
[prelabel,accuracy,decision_values]=svmpredict(lable(301:600),im(301:600,:),model);                 %预测

```

* 输出

*以下略*

