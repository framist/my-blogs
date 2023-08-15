---
title: 【Java】上机作业报告2
categories: 
- 计算机科学
- 课业学习
- Java
tags: 
- Java
- 学习
---

# 上机报告2

> java第二次上机作业: 1、作业内容: 习题3-2，3-3，3-9，4-2。 其中4-2不需要提交程序，仅在上机报告中描述为什么会有这样的运行结果。 2、报告格式: 将报告和程序一起打压缩包发送到████████████邮箱，压缩包必须命名为“上机作业2-学号-姓名”。 注:如果压缩包命名格式错误，会漏统计！

<!--more-->

<br/>

## 3-2

按题目要求建立类如下：

```java
class NewRectangle {
	double width;
	double height;

	public NewRectangle() {
		width = 0.0;
		height = 0.0;
	}

	public NewRectangle(double w, double h) {
		width = w;
		height = h;
	}

	public double getArea() {
		return width * height;
	}

	public double getPerimeter() {
		return 2 * (width + height);
	}
}
```



---

## 3-3

### （1）

```java
class Point {
	double x;
	double y;

	public Point() {
		x = 0.0;
		y = 0.0;
	}

	public Point(double x, double y) {
		this.x = x;
		this.y = y;
	}

	public double distance(Point p) {
		return Math.sqrt(Math.pow(x - p.x, 2) + Math.pow(y - p.y, 2));
	}

}
```



### （2）（3）（4）

这里认为点在矩形的边上也属于内部

```java
class NewRectangle {
	double width;
	double height;
	Point coordinatesLD;

	public NewRectangle() {
		width = 0.0;
		height = 0.0;
		coordinatesLD = new Point();
	}

	public NewRectangle(double w, double h) {
		width = w;
		height = h;
		coordinatesLD = new Point();
	}

	public NewRectangle(double w, double h, double x, double y) {
		width = w;
		height = h;
		coordinatesLD = new Point(x, y);
	}

	public double getArea() {
		return width * height;
	}

	public double getPerimeter() {
		return 2 * (width + height);
	}

	boolean bPointIn(Point p) {
		if (coordinatesLD.x <= p.x && coordinatesLD.y <= p.y && coordinatesLD.x + width >= p.x && coordinatesLD.y + height >= p.y) {
			return true;
		} else {
			return false;
		}
	}


}

```





### （5）

可以实现：

```java
	boolean bRectangleIn(NewRectangle R) {
		Point p = R.coordinatesLD;
		if (! bPointIn(p)) {
			return false;
		}
		p = new Point(R.coordinatesLD.x + width, R.coordinatesLD.y + height);
		if (! bPointIn(p)) {
			return false;
		}
		return true;
	}

	boolean bRectangleOverlap(NewRectangle R) {
		Point p = R.coordinatesLD;
		if (bPointIn(p)) {
			return true;
		}
		p = new Point(R.coordinatesLD.x + width, R.coordinatesLD.y + height);
		if (bPointIn(p)) {
			return true;
		}
		p = new Point(R.coordinatesLD.x, R.coordinatesLD.y + height);
		if (bPointIn(p)) {
			return true;
		}
		p = new Point(R.coordinatesLD.x + width , R.coordinatesLD.y);
		if (bPointIn(p)) {
			return true;
		}
		if (R.bRectangleOverlap(this)) {
			return true;
		}
		return false;
	}
```

### 综上

```java

class NewRectangle {
	double width;
	double height;
	Point coordinatesLD;

	public NewRectangle() {
		width = 0.0;
		height = 0.0;
		coordinatesLD = new Point();
	}

	public NewRectangle(double w, double h) {
		width = w;
		height = h;
		coordinatesLD = new Point();
	}

	public NewRectangle(double w, double h, double x, double y) {
		width = w;
		height = h;
		coordinatesLD = new Point(x, y);
	}

	public double getArea() {
		return width * height;
	}

	public double getPerimeter() {
		return 2 * (width + height);
	}

	boolean bPointIn(Point p) {
		if (coordinatesLD.x <= p.x && coordinatesLD.y <= p.y && coordinatesLD.x + width >= p.x && coordinatesLD.y + height >= p.y) {
			return true;
		} else {
			return false;
		}
	}

	boolean bRectangleIn(NewRectangle R) {
		Point p = R.coordinatesLD;
		if (! bPointIn(p)) {
			return false;
		}
		p = new Point(R.coordinatesLD.x + width, R.coordinatesLD.y + height);
		if (! bPointIn(p)) {
			return false;
		}
		return true;
	}

	boolean bRectangleOverlap(NewRectangle R) {
		Point p = R.coordinatesLD;
		if (bPointIn(p)) {
			return true;
		}
		p = new Point(R.coordinatesLD.x + width, R.coordinatesLD.y + height);
		if (bPointIn(p)) {
			return true;
		}
		p = new Point(R.coordinatesLD.x, R.coordinatesLD.y + height);
		if (bPointIn(p)) {
			return true;
		}
		p = new Point(R.coordinatesLD.x + width , R.coordinatesLD.y);
		if (bPointIn(p)) {
			return true;
		}
		if (R.bRectangleOverlap(this)) {
			return true;
		}
		return false;
	}
}

class Point {
	double x;
	double y;

	public Point() {
		x = 0.0;
		y = 0.0;
	}

	public Point(double x, double y) {
		this.x = x;
		this.y = y;
	}

	public double distance(Point p) {
		return Math.sqrt(Math.pow(x - p.x, 2) + Math.pow(y - p.y, 2));
	}

}

```



---

## 3-9

程序如下：



```java
class Cycle {
	void ride() {
		System.out.println("Oh, I have " + this.wheel() + " wheels.");
		if (this instanceof UniCycle) {
			UniCycle a = (UniCycle) this;
			a.balance();
		}
		if (this instanceof BiCycle) {
			BiCycle a = (BiCycle) this;
			a.balance();
		}
	}

	int wheel() {
		return 0;
	}
}

class UniCycle extends Cycle {
	int wheel() {
		return 1;
	}

	void balance() {
		System.out.println("Oh, I must be balance it!");
	}
}

class BiCycle extends Cycle {
	int wheel() {
		return 2;
	}

	void balance() {
		System.out.println("Oh, I must be balance it!");
	}
}

class TriCycle extends Cycle {
	int wheel() {
		return 3;
	}
}
```

如果以此运行：

```java
public class homework_3_9 {

	public static void main(String[] args) {
		Cycle a = new BiCycle();
		a.ride();
	}

}
```

将产生如下输出：

```shell
Oh, I have 2 wheels.
Oh, I must be balance it!
```

>`instanceof` 是 Java 的一个二元操作符，类似于 ==，>，< 等操作符。
>
>`instanceof` 是 Java 的保留关键字。它的作用是测试它左边的对象是否是它右边的类的实例，返回 boolean 的数据类型。

## 4-2

修改之后的输出为：

```shell
Create new C() in main
A(4)
A(5)
A(3)
C()
f1(2)
Create new C() in main
A(3)
C()
f1(2)
Exception in thread "main" java.lang.NullPointerException
	at StaticInitialization.main(StaticInitialization.java:9)
```

比较修改之前的输出为：

```shell
A(1)
A(2)
B()
f1(1)
A(4)
A(5)
A(3)
C()
f1(2)
Create new C() in main
A(3)
C()
f1(2)
Create new C() in main
A(3)
C()
f1(2)
f2(1)
f3(1)
```

去掉`new B()`与`new C()`

所以以下内容输出缺失：



| 原始输出                                                     | 修改后的输出                                                 | 解释                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| A(1)<br/>A(2)<br/>B()<br/>f1(1)<br/>A(4)<br/>A(5)<br/>A(3)<br/>C()<br/>f1(2) | 无                                                           | 去掉`new B()`与`new C()`，运行前缺失对B、C类装载，所以此部分无输出 |
| Create new C() in main<br/>A(3)<br/>C()<br/>f1(2)            | Create new C() in main<br/>A(4)<br/>A(5)<br/>A(3)<br/>C()<br/>f1(2) | 因为C此时是第一次装载，故初始化静态成员，输出`A(4)`、`A(5)`  |
| Create new C() in main<br/>A(3)<br/>C()<br/>f1(2)<br/>       | Create new C() in main<br/>A(3)<br/>C()<br/>f1(2)            | 此部分相同                                                   |
| f2(1)<br/>f3(1)                                              | Exception in thread "main" java.lang.NullPointerException<br/>	at StaticInitialization.main(StaticInitialization.java:9) | `bb`与`cc`没有引用的对象导致出错                             |

