---
title: 【Java】Java期末考复习
categories: 
- 计算机科学
- 课业学习
- Java
tags: 
- Java
- 学习
---
# Java复习

> 2020 秋学期高级语言程序设计复习要点 
>
> 复习范围： 
>
> 1. 本课程课堂讲授的所有课件的内容 
> 2. 本课程在线学时中的以下内容： 
>    1. 容器类的所有内容；
>    2. 常用预定义类中的字符串操作、Wrapper 类 
>
> 本次考试的一些重点内容： 
>
> 1. 方法参数的传递
> 2. 子类对象的创建与初始化
> 3. 动态绑定（非动态绑定的情况）
> 4. 成员变量的隐藏
> 5. 静态变量的创建过程（与子类对象创建过程结合）
> 6. 静态方法的重写规则
> 7. 对象串行化
> 8. 字符串的操作与比较 


<!--more-->


## 本课程课堂讲授的所有课件的内容





| 修饰符      | 当前类 | 同一包内 | 子孙类(同一包) | 子孙类(不同包)                                               | 其他包 |
| :---------- | :----- | :------- | :------------- | :----------------------------------------------------------- | :----- |
| `public`    | Y      | Y        | Y              | Y                                                            | Y      |
| `protected` | Y      | Y        | Y              | Y/N（[说明](https://www.runoob.com/java/java-modifier-types.html#protected-desc)） | N      |
| `default`   | Y      | Y        | Y              | N                                                            | N      |
| `private`   | Y      | N        | N              | N                                                            | N      |

protected 需要从以下两个点来分析说明：

- **子类与基类在同一包中**：被声明为 protected 的变量、方法和构造器能被同一个包中的任何其他类访问；
- **子类与基类不在同一包中**：那么在子类中，子类实例可以访问其从基类继承而来的 protected 方法，而不能访问基类实例的protected方法。

## 容器类

### 泛型的基本概念

泛型: 又称为参数化类型, 通过定义含有一个或多个类型参数的
类或接口, 对具有类似特征与行为的类进行抽象

类型参数：可以指代任何具体类型
例: JDK中java.util.ArrayList\<E>的定义, ArrayList\<E>定义了
一个泛型, E为类型参数, 它代表了能够放入ArrayList中的对象的

类型

如何使用一个预定义的泛型？
对泛型中的类型参数进行具体化，即可得到具体的类

例: 如果希望创建一个能够存放String对象的ArrayList, 应使用
ArrayList\<String>进行声明。ArrayList\<String>总是可以被看作
一个具体的类, 该类的实例作为容器可以存放String类型的对象  

### 容器类

一个容器类的实例（容器、容器对象）表示了一组对象,
容器对象存放指向其他对象的引用  

### Set

三种接口实现：HashSet, TreeSet, LinkedHashSet  



三种接口实现：HashSet, TreeSet, LinkedHashSet

HashSet：采用Hash表实现Set接口，元素无固定顺序，对元素的
访问效率高

TreeSet：实现了SortedSet接口，采用有序树结构存储集合元素，
元素按照比较结果的升序排列

LinkedHashSet：采用Hash表和链表结合的方式实现Set接口，元
素按照被添加的先后顺序保存  

```java
import java.util.*;

public class TestSet {
    public static void main(String[] args) {
        Random rand = new Random(47);
        Set<Integer> s = new HashSet<Integer>();
        for (int i = 0; i < 5000; i++) {
            s.add(rand.nextInt(40));
        }
        System.out.println(s);
        
        s = new TreeSet<Integer>();
        for (int i = 0; i < 5000; i++) {
            s.add(rand.nextInt(40));
        }
        System.out.println(s);

        s = new LinkedHashSet<Integer>();
        for (int i = 0; i < 5000; i++) {
            s.add(rand.nextInt(40));
        }
        System.out.println(s);
    }
}
```

```
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39]
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39]
[28, 15, 39, 14, 16, 29, 24, 37, 6, 25, 2, 1, 32, 3, 36, 38, 5, 22, 23, 7, 8, 21, 33, 17, 18, 30, 31, 0, 27, 4, 19, 9, 12, 35, 34, 10, 26, 20, 13, 11]
```

- [x] HashSet为什么最后输出又是有序的？[参考](https://www.zhihu.com/question/28414001)

当循环次数改小了之后，又是无序的了：

```java
Random rand = new Random(47);
Set<Integer> s = new HashSet<Integer>();
for (int i = 0; i < 10; i++) {
    s.add(rand.nextInt(40));
}
System.out.println(s);
```

```
[0, 1, 18, 2, 35, 21, 7, 28, 13, 29]
```



* equals()方法与对象等价性

如何测试对象的等价性？

“==”和“!=”比较的是对象的引用而非对象的内容

（引用相等：指向同一块堆空间）

所有对象都拥有从Object类继承的equals()方法,

equals()方法默认也是比较对象的引用  

```java
class Value {
    int i;

    public boolean equals(Value v) {
        return (this.i == v.i) ? true : false;
    }
}

public class Equivalence {
    public static void main(String[] args) {
        Integer n1 = new Integer(47);
        Integer n2 = new Integer(47);
        System.out.println("n1==n2: " + (n1 == n2)); // 对引用的比较
        System.out.println("n1!=n2: " + (n1 != n2));
        System.out.println("n1.equals(n2): " + n1.equals(n2));// Integer已重写equals()
        Value v1 = new Value();
        Value v2 = new Value();
        v1.i = v2.i = 10;
        System.out.println("v1.equals(v2): " + v1.equals(v2));
    }
}
```

```
n1==n2: true
n1!=n2: false
n1.equals(n2): true
v1.equals(v2): true
```

![image-20201129170004250](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815202827.png)

### List

两种接口实现：ArrayList, LinkedList  

ArrayList：采用可变大小的数组实现List接口
无需声明上限，随着元素的增加，长度自动增加
对元素的随机访问速度快，插入/移除元素较慢
该类是非同步的，相对于Vector（legacy）效率高

LinkedList：采用链表结构实现List接口
实际上实现了List接口、Queue接口和双端队列Deque接口，
因此可用来实现堆栈、队列或双端队列
插入/移除元素快，对元素的随机访问较慢
该类是非同步的  

### Queue

两种接口实现：LinkedList, PriorityQueue  

### Map

接口实现：HashMap, TreeMap, LinkedHashMap  

把键映射到某个值
一个键最多只能映射一个值
一个值可对应多个键  





接口实现：HashMap, TreeMap, LinkedHashMap
把键映射到某个值
一个键最多只能映射一个值
一个值可对应多个键
常用：HashMap（无序）和TreeMap（有序）
HashMap：使用Hash表实现Map接口
无序，非同步且允许空的键与值
相比Hashtable（legacy）效率高
TreeMap：与TreeSet类似，使用有序树实现SortedMap接口
保证“键”始终处于排序状态  



### 迭代器(Iterator)  



Iterator是一个轻量级对象，用于遍历并选择序列中的对象

用法

- 使用容器的iterator()方法返回容器的迭代器，该迭代器准备返回容器的第一个元素
- 迭代器只能单向移动
- next()：获得序列的下一个元素
- hasNext()：检查序列中是否还有元素
- remove()：将迭代器新近返回的元素（即由next()产生的最后一个
- 元素）删除，因此在调用remove()之前必须先调用next()  

```java
import java.util.*;

public class TestIterator {
    public static void main(String[] args) {
        String sentence = "I believe I can fly, I believe I can touch the sky.";
        String[] strs = sentence.split(" ");
        List<String> list = new ArrayList<String>(Arrays.asList(strs));
        Iterator<String> it = list.iterator();

        while (it.hasNext())
            System.out.print(it.next() + "_");
        System.out.println();

        it = list.iterator();
        while (it.hasNext()) {
            if (it.next().equals("I"))
                it.remove();
        }
        
        it = list.iterator();
        while (it.hasNext())
            System.out.print(it.next() + " ");
        System.out.println();
    }
}
```

```
I_believe_I_can_fly,_I_believe_I_can_touch_the_sky._
believe can fly, believe can touch the sky.
```



## Wrapper 类

Wrapper类实例的构造：将基本数据类型值传递给Wrapper类的
构造方法
Wrapper类的常用方法和常量
数值型Wrapper类中的MIN_VALUE, MAX_VALUE
byteValue()/shortValue()/longValue(), ... :
将当前Wrapper类型的值作为byte/short/long/...返回
valueOf()：将字符串转换为Wrapper类型的实例
toString()：将基本类型值转换为字符串
parseByte()/parseShort()/parseInt(), ... :
将字符串转换为byte/short/int/...类型值  



Autoboxing：在应该使用对象的地方使用基本类型的数据时，
编译器自动将该数据包装为对应的Wrapper类对象
Autounboxing：在应该使用基本类型数据的地方使用Wrapper
类的对象时，编译器自动从Wrapper类对象中取出所包含的基
本类型数据  

![image-20201129164210111](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815202827-1.png)

---

## 方法参数的传递

将方法参数指明为final，则无法在方法中更改参数的值  

final的使用位置
在类声明中使用：表示类不能被继承
在成员方法声明及方法参数中使用：成员方法不能被重写，
参数变量值不能更改
在成员变量和局部变量声明中使用：表示变量的值不能更改  

被定义成final的成员变量，一旦被赋值就不能改变
对于基本类型的成员变量：
数值不变
用来定义常量：声明final变量并同时赋初值
对于引用类型的成员变量：
引用不变，但被引用对象可被修改
这一约定同样适用于数组  

## 子类对象的创建与初始化

子类构造方法调用父类构造方法
通过显式的super()方法调用或编译器隐含插入的super()方法调用
这一过程递归地进行, 直到根类Object的构造方法。在这一过程中,
子类对象所需的所有内存空间被分配, 所有成员变量均使用默认值
初始化  

从根类Object的构造方法开始, 自顶向下地对每个类依次执行如
下两步:
显式初始化及使用实例初始化程序块进行初始化
执行构造方法的主体（不包括使用super()调用父类构造方法的语
句）  



## 动态绑定（非动态绑定的情况）

Java中除了static方法和final方法（private方法属于final方
法），其余方法都采用动态绑定  

```java
public class PrivOverride {
    private void f() {
        System.out.println("private f()");
    }

    public static void main(String[] args) {
        PrivOverride po = new Derived();
        po.f();
    }
}

class Derived extends PrivOverride {
    public int a;

    public void f() {
        System.out.println("public f()");
    }
}
```

输出：`private f()`



动态绑定：绑定操作在程序运行时根据变量指向的对象实例的具体
类型找到正确的方法体(而不是根据变量本身的类型)  

## 成员变量的隐藏

- 概念: 父类中成员变量被子类中同名的成员变量隐藏
- 成员变量隐藏和成员方法重写的前提
  - 父类成员能够在子类中被访问到
  - 父类中private成员，在子类中不能被隐藏（重写）  

```java
public class Sub extends Super {
    String s = "sub";

    public static void main(String[] args) {
        Super sup = new Sub();
        System.out.println(sup.s);
    }
}

class Super {
    String s = "super";
}
//super



class NotOverriding extends Base {
    private int i = 2;

    public static void main(String[] args) {
        NotOverriding no = new NotOverriding();
        no.increase();
        System.out.println(no.i);
        System.out.println(no.getI());
    }
}

class Base {
    private int i = 100;

    public void increase() {
        this.i++;
    }

    public int getI() {
        return this.i;
    }
}
//2
//201
```



## 静态变量的创建过程（与子类对象创建过程结合）

静态变量的创建与实例对象无关
只在系统加载其所在类时分配空间并初始化, 且在创建该类的
实例对象时不再分配空间

什么时候加载其所在类？

* 运行到不得不加载该类的时候 

什么是“不得不加载该类的时候”?

- 即将创建该类的第一个对象时
- 首次使用该类的静态方法或静态变量时
- 加载一个类之前要先加载其父类

```java
class T1 {
    static int s1 = 1;
    static {
        System.out.println("static block of T1: " + T2.s2);
    }

    T1() {
        System.out.println("T1(): " + s1);
    }
}

class T2 extends T1 {
    static int s2 = 2;
    static {
        System.out.println("static block of T2: " + T2.s2);
    }

    T2() {
        System.out.println("T2(): " + s2);
    }
}

public class InheritStaticInit {
    public static void main(String[] args) {
        new T2();
    }
}
```

```
static block of T1: 0
static block of T2: 2
T1(): 1
T2(): 2
```

> 静态块（static{}）
>
> （1） static关键字还有一个比较关键的作用，用来形成静态代码块（static{}(即static块)）以优化程序性能。
>
> （2） static块可以置于类中的任何地方，类中可以有多个static块。
>
> （3） 在类初次被加载的时候执行且仅会被执行一次（这是优化性能的原因！！！），会按照static块的顺序来执行每个static块，一般用来初始化静态变量和调用静态方法。

https://www.cnblogs.com/ysocean/p/8194428.html

## 静态方法的重写规则

回顾方法重写的规则：

- 不改变方法的名称、参数列表和返回值，改变方法的内部实现
- 子类中重写方法的访问权限不能缩小
- 子类中重写方法不能抛出新的异常
- 父类中private的成员，在子类中不能被隐藏（重写）

本节加入以下重写规则：

- 子类不能把父类的静态方法重写为非静态
- 子类不能把父类的非静态方法重写为静态
- 子类可以声明与父类静态方法相同的方法
- 静态方法的重写不会导致多态性
- 构造方法本质上是static方法，不具有多态性

```java
public class StaticPolymorphism {
    public static void main(String[] args) {
        Sup s = new Sub();
        s.mtd1();
        s.mtd2(); // 静态方法的重写不会导致多态性
    }
}

class Sup {
    public void mtd1() {
        System.out.println("Sup.instanceMethod");
    }

    public static void mtd2() {
        System.out.println("Sup.staticMethod");
    }
}

class Sub extends Sup {
    // public static void mtd1() {} //静态方法不能隐藏实例方法
    // public void mtd2() {} //实例方法不能重写静态方法
    public void mtd1() {
        System.out.println("Sub.instanceMethod");
    }

    public static void mtd2() {
        System.out.println("Sub.staticMethod");
    }
}
```

```
Sub.instanceMethod
Sup.staticMethod
```

若为：

```java
public class StaticPolymorphism {
    public static void main(String[] args) {
        Sup s = new Sub();
        s.mtd1();
        s.mtd2(); // 静态方法的重写不会导致多态性
    }
}

class Sup {
    public void mtd1() {
        System.out.println("Sup.instanceMethod");
    }

    public void mtd2() {
        System.out.println("Sup.staticMethod");
    }
}

class Sub extends Sup {
    // public static void mtd1() {} //静态方法不能隐藏实例方法
    // public void mtd2() {} //实例方法不能重写静态方法
    public void mtd1() {
        System.out.println("Sub.instanceMethod");
    }

    public void mtd2() {
        System.out.println("Sub.staticMethod");
    }
}
```

则

```
Sub.instanceMethod
Sub.staticMethod
```



## 对象串行化

将对象的状态转换成一个字节序列，这个字节序列能够存储在
外存中，能够在网络上传送，并能够在以后被完全恢复为原来
的对象
对象串行化机制的典型应用场景
Java远程方法调用(Remote Method Invocation, RMI)
Java Bean / EJB  



对象串行化的方法

通过ObjectOutputStream的writeObject方法将一个对象写入到
流中

public final void writeObject(Object obj) throws IOException
通过ObjectInputStream的readObject方法将一个对象从对象流
中读出

public final Object readObject() throws IOException,

ClassNotFoundException

ObjectOutputStream实现了java.io.DataOutput接口

ObjectInputStream实现了java.io.DataInput接口  

```java
import java.io.*;
import java.util.Date;

public class SerializeDate {
    public static void main(String args[]) throws IOException {
        Date d = new Date();
        ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream("date.dat"));
        out.writeObject(d);
        out.close();
    }
}

class UnSerializeDate {
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        ObjectInputStream in = new ObjectInputStream(new FileInputStream("date.dat"));
        Object o = in.readObject();
        in.close();
        if (o instanceof Date)
            System.out.println(((Date) o).toString());
    }
}
```





## 字符串的操作与比较 

| boolean equals(Object anObject)     boolean equalsIgnoreCase(String anotherString) | 比较两个字符串的内容是否相同（不忽略/忽略 大小写） |
| ------------------------------------------------------------ | -------------------------------------------------- |
|                                                              |                                                    |



# 例题

来源：西安电子科技大学，2020

一、简答题（每题5分，共20分）
1. 简述方法重载与方法重写的区别。



https://www.cnblogs.com/zheting/p/7751787.html



2. 简述如何保证向下转型（downcasting）的正确性。

https://blog.csdn.net/tntzs666/article/details/80274526

向下转型必须是在向上转型之后才能进行。

instanceof用法： 
 **对象名 instanceof 类名** ，判断这个对象是否是属于这个类或是其子类 

3. 简述抽象类与接口的区别。（6分）

https://kb.cnblogs.com/page/42159/



二、读程题（每空2分，共40分）

给出下列Java程序代码片段的运行结果

```java
String str1 = "first string";
String str2 = new String("second string");
String str3 = “third string”;
str3 = str2;
str2 = str1;
System.out.println(str1);
System.out.println(str2);
System.out.println(str3); 
```

```
first string
first string
second string
```





```java
class Employee {
    public int id;
    public static int serialNum = 1;

    Employee() {
        id = serialNum++;
    }
}

public class EmployeeTest {
    public static void main(String[] args) {
        Employee e1 = new Employee();
        Employee e2 = new Employee();
        System.out.println("e1.serialNum:" + e1.serialNum);
        System.out.println("e1.id:" + e1.id);
        System.out.println("e2.serialNum:" + e2.serialNum);
        System.out.println("e2.id:" + e2.id);
    }
}
```

```
e1.serialNum:3
e1.id:1
e2.serialNum:3
e2.id:2
```

```java
class Fu {
	static int fustatic = 10;
	int fus = 100;
	static {
		System.out.println("static block of Fu: " + Zi.zistatic);
	}
	{
		System.out.println("constructor block of Fu: " + fus);
	}
	Fu() {
		System.out.println("Fu(): " + fustatic);
	}
}

class Zi extends Fu {
	static int zistatic = 20;
	int zis = 50;
	static {
		System.out.println("static block of Zi: " + Zi.zistatic);
	}
	{
		System.out.println("constructor block of Zi: " + zis);
	}

	Zi() {
		System.out.println("Zi(): " + zistatic);
	}
}

public class TestDemo {
	public static void main(String[] args) {
		new Zi();
	}
}

```

```
static block of Fu: 0
static block of Zi: 20
constructor block of Fu: 100
Fu(): 10
constructor block of Zi: 50
Zi(): 20
```



```java
public class Test extends Base{
	private int i=2;
	public void printI(){
		System.out.println(this.i);
		System.out.println(this.getI());
	}
	public static void main(String[] args){
		Base base=new Test();
		base.increase();
		base.printI();
		
		if(base instanceof Test){
			Test sub=(Test)base;
			sub.increase();
			sub.printI();
		}
	}
}
class Base{
	private int i=100;
	public void printI(){
		System.out.println(this.i);
		System.out.println("do nothing");
	}
	public final void increase(){
		this.i++;
	}
	public int getI(){
		return this.i;
	}
}

```

```
2
101
2
102
```

**假设下列程序中s1语句会抛出EType2异常**

```java
try{
   System.out.println("before Exception. "); 
    s1; 
    System.out.println("after Exception.");
} catch (Exception e){ 
   System.err.println("In Exception catch process."); 
} catch(EType2 e){
	System.out.println("In Etype2 catch process.");
} finally{
	System.out.println("In finally process.");
}

```

```
before Exception. 
In Etype2 catch process.
In finally process.
```

三、改错题（共10分）
键盘录入多个数据，以0结束，要求在控制台输出这多个数据中的最大值.
下面Java程序中存在五处编译错误，指出错误位置，说明错误原因并更正。

```java
public class ArrayListDemo {
	public static void main(String[] args) {
		// 创建键盘录入数据对象
		Scanner sc = new Scanner(System.out);

		// 键盘录入多个数据,我们不知道多少个，所以用集合存储
		ArrayList<Object> array = new ArrayList<int>();

		// 以0结束。这个简单，只要键盘录入的数据是0，我就
		// 跳出循环，不继续处理了
		while (true) {
			System.out.println("请输入数据：");
			int number = sc.nextInt();
			if (number != 0) {
				array.add(number);
			} else {
				break;
			}
		}

		// 把集合转成数组
		Integer[] i = new int[array.length()];
		array.toArray(i);
		// 对数组排序
		Arrays.sort(i);
		// 获取该数组中的最大索引的值
		System.out.println("数组最大值是:" + i[i.length()]);
	}
}

```



```
import java.util.*;

Scanner sc = new Scanner(System.in);

ArrayList<Integer> array = new ArrayList<Integer>();

System.out.println("数组最大值是:" + i[i.length-1]);

sc.close();
```



---



# 考后总结

复习的一到考场就忘光光，嘤文记不住只能写中文...

~~都什么年代什么学校了，还笔试写程序，还考谭浩强题，有什么意义[doge]~~



2020-11-29 20:28:47

