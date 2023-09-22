---
title: Python only with Lambda
categories:
  - 计算机科学
  - 计算机理论
tags:
  - Python
  - SICP
hidden: true
abbrlink: Python-only-with-lambda
date: 2022-10-28 11:29:13
---

# Python 但是只有 lambda

当可爱的 Python 只有 $\lambda$ 表达式后会发生什么呢？我们还能构建出我们万能的 Python 吗？

*学习《SICP》中的小作*


<!-- more -->

## 抽象

> 程序设计的基本元素
> - 基本表达形式
> - 组合的方法
> - 抽象的方法

## 组合

## 设计

---

*未完待续*

TODO：
- 函数装饰器
- 魔法
- 实现数据结构

# 函数式编程的妙用



# 其他的一些例子

## L 画家

对 [CS61a 其中的一个示例（Sound）](https://cs61a.org/lecture/lec06/) 的拙劣模仿。原例子十分有趣，建议直接去看原视频而不是看下面这个模仿

```python
import cv2
import numpy as np
from typing import List

# imitate https://www.youtube.com/watch?v=TC_JcE42R2s&list=PL6BsET-8jgYVoDRPWXvw3q5ZsdpwVeEyY

BLUE = np.array([255, 0, 0])
GREEN = np.array([0, 255, 0])
RED = np.array([0, 0, 255])

SIZE = 512

def paint_to_file(painter, name="paint.png", size=(SIZE, SIZE)):
    """lambda paint to file!
    使用画家函数`painter`逐像素地作画
    """
    img = np.zeros((*size, 3), np.uint8)

    # TODO 尝试用 map
    for i in range(size[0]):
        for j in range(size[1]):
            img[i][j] = painter(i, j)

    cv2.imwrite(name, img)
    cv2.imshow("img", img)
    cv2.waitKey()

# 颜色
def color(c: List[int]):
    def painter(i, j):
        return c
    return painter

# 叠加
def both(f, g):
    return lambda x, y: (f(x, y) + g(x, y))  # / 2

# 空间
def box(f, x, y, r):
    def painter(i, j):
        if x - r <= i <= x + r and y - r <= j <= y + r:
            return f(i, j)
        else:
            return np.array([0, 0, 0])
    return painter

# 画三个方块！
paint_to_file(
    both(
        both(
            box(color(BLUE), SIZE//4+42, SIZE//2, SIZE//4),
            box(color(GREEN), SIZE//4*3-42, SIZE//4+42, SIZE//4)
        ),
        box(color(RED), SIZE//4*3-42, SIZE//4*3-42, SIZE//4)
    )
)

# 画混沌游戏！
rand = random.random
vertexs = [[0, SIZE], [SIZE, 0], [SIZE, SIZE]]
f = color(GREEN/10)
dot = np.array([SIZE*rand(), SIZE*rand()])
f = both(f, box(color(RED), dot[0], dot[1], SIZE/200))
for _ in range(100):
    vertex = random.choice(vertexs)
    dot = (dot + vertex) / 2
    f = both(f, box(color(RED/2), dot[0], dot[1], SIZE/200))

paint_to_file(f)

```





![paint](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/paint.png)
