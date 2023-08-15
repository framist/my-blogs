---
title: 【Java】上机作业报告 3
categories: 
- 计算机科学
- 课业学习
- Java
tags: 
- Java
- 学习
---



# 上机报告 3

> java 第三次上机作业：
>
> 1、作业内容：习题 6-10,8-2。DDL：2020 年 11 月 17 日 23:59:59
>
> 2、报告格式：将报告和程序一起打压缩包发送到████████████邮箱，压缩包必须命名为“上机作业 3-学号 - 姓名”。注：如果压缩包命名格式错误，会漏统计！

<!--more-->

<br/>

## 6-10

**题目**：实现一个类`KeywoldIdentifier`，读入一个.java 文件，输出各个关键字的个数（注释中的不算）。

* Java 关键字如下：

| **关键字**   | **含义**                                                     |
| ------------ | ------------------------------------------------------------ |
| abstract     | 表明类或者成员方法具有抽象属性                               |
| assert       | 断言，用来进行程序调试                                       |
| boolean      | 基本数据类型之一，声明布尔类型的关键字                       |
| break        | 提前跳出一个块                                               |
| byte         | 基本数据类型之一，字节类型                                   |
| case         | 用在 switch 语句之中，表示其中的一个分支                       |
| catch        | 用在异常处理中，用来捕捉异常                                 |
| char         | 基本数据类型之一，字符类型                                   |
| class        | 声明一个类                                                   |
| const        | 保留关键字，没有具体含义                                     |
| continue     | 回到一个块的开始处                                           |
| default      | 默认，例如，用在 switch 语句中，表明一个默认的分支。Java8 中也作用于声明接口函数的默认实现 |
| do           | 用在 do-while 循环结构中                                       |
| double       | 基本数据类型之一，双精度浮点数类型                           |
| else         | 用在条件语句中，表明当条件不成立时的分支                     |
| enum         | 枚举                                                         |
| extends      | 表明一个类型是另一个类型的子类型。对于类，可以是另一个类或者抽象类；对于接口，可以是另一个接口 |
| final        | 用来说明最终属性，表明一个类不能派生出子类，或者成员方法不能被覆盖，或者成员域的值不能被改变，用来定义常量 |
| finally      | 用于处理异常情况，用来声明一个基本肯定会被执行到的语句块     |
| float        | 基本数据类型之一，单精度浮点数类型                           |
| for          | 一种循环结构的引导词                                         |
| goto         | 保留关键字，没有具体含义                                     |
| if           | 条件语句的引导词                                             |
| implements   | 表明一个类实现了给定的接口                                   |
| import       | 表明要访问指定的类或包                                       |
| instanceof   | 用来测试一个对象是否是指定类型的实例对象                     |
| int          | 基本数据类型之一，整数类型                                   |
| interface    | 接口                                                         |
| long         | 基本数据类型之一，长整数类型                                 |
| native       | 用来声明一个方法是由与计算机相关的语言（如 C/C++/FORTRAN 语言）实现的 |
| new          | 用来创建新实例对象                                           |
| package      | 包                                                           |
| private      | 一种访问控制方式：私用模式                                   |
| protected    | 一种访问控制方式：保护模式                                   |
| public       | 一种访问控制方式：共用模式                                   |
| return       | 从成员方法中返回数据                                         |
| short        | 基本数据类型之一，短整数类型                                  |
| static       | 表明具有静态属性                                             |
| strictfp     | 用来声明 FP_strict（单精度或双精度浮点数）表达式遵循[IEEE 754](https://baike.baidu.com/item/IEEE 754)算术规范 |
| super        | 表明当前对象的父类型的引用或者父类型的构造方法               |
| switch       | 分支语句结构的引导词                                         |
| synchronized | 表明一段代码需要同步执行                                     |
| this         | 指向当前实例对象的引用                                       |
| throw        | 抛出一个异常                                                 |
| throws       | 声明在当前定义的成员方法中所有需要抛出的异常                 |
| transient    | 声明不用序列化的成员域                                       |
| try          | 尝试一个可能抛出异常的程序块                                 |
| void         | 声明当前成员方法没有返回值                                   |
| volatile     | 表明两个或者多个变量必须同步地发生变化                       |
| while        | 用在循环结构中                                               |

先把 Java 关键字储存在`keyword.txt`中：

```
abstract
assert
boolean
break
byte
case
catch
char
class
const
continue
default
do
double
else
enum
extends
final
finally
float
for
goto
if
implements
import
instanceof
int
interface
long
native
new
package
private
protected
public
return
strictfp
short
static
super
switch
synchronized
this
throw
throws
transient
try
void
volatile
while
```



注意排除注释中的内容，有以下两种情况：

* `//`开始`\n`结束

* `/*`开始`*/`结束

另外

* 注意`"`内的不是关键字

全部代码如下：

```java
package regex;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Map;
import java.util.TreeMap;

public class homework_6_10 {

	public static void main(String[] args) throws IOException {
		keywordIdentifier sc = new keywordIdentifier();
        sc.keyWord();
        long filePoint = 0;
        String s;
        boolean inAnnotation = false; //是否在块注释内
        RandomAccessFile file = new RandomAccessFile("D:\\code\\Java-XDU\\java-book-code\\book-code\\chap06\\regex\\homework_6_10.java", "r");
        long fileLength = file.length();
        while(filePoint < fileLength) {
            s = file.readLine();
            s = s.replaceAll("\"(\\\\.|[^\\\\\"])*\"", " ");//去除引号内
            if(inAnnotation) {
            	if(s.indexOf("*/") != -1) {
            		s = s.substring(s.indexOf("*/"));
                	inAnnotation = false;
                }else {
                	s = "";
                }
            }
            if(s.indexOf("/*") != -1) {
            	if(s.indexOf("*/") != -1) {
                	s = s.substring(0,s.indexOf("/*")) + s.substring(s.indexOf("*/"));
                }else {
                	s = s.substring(0,s.indexOf("/*"));
                	inAnnotation = true;
                }
            }
            sc.keyWordCounter(s);
            filePoint = file.getFilePointer();
        }
        file.close();
        
        sc.output();
	}

}


class keywordIdentifier {

    private Map<String, Integer> keyWordCount = new TreeMap<String, Integer>();
    
    public void keyWord() throws IOException {
        long filePoint = 0;
        String s;

        RandomAccessFile file = new RandomAccessFile("D:\\code\\Java-XDU\\java-book-code\\book-code\\chap06\\regex\\keyword.txt", "r");
        long fileLength = file.length();
        while(filePoint < fileLength) {
            s = file.readLine();

            String[] s1 = s.split(" ");
            Integer freq = new Integer(0);
            for(String word : s1) {
                keyWordCount.put(word, freq);
            }
            
            filePoint = file.getFilePointer();
        }
        file.close();
    }
    
    public void keyWordCounter(String s){
        int pos = s.indexOf("//");
        if(pos == -1) {
            pos = s.length();
        }
        String sub = s.substring(0, pos);
        String sub1 = sub.replaceAll("\\W", " ");
        String sub2 = sub1.replaceAll(" +",  " ");
        String[] sArray = sub2.split(" ");
        Integer freq;
        for(String word : sArray) {
            freq = keyWordCount.get(word);
            if(freq != null) {
                freq = new Integer(freq.intValue() + 1);
                keyWordCount.put(word, freq);
            }
        }
    }
    
    public void output() {
        System.out.println(keyWordCount);
    }
    
}
/*
abstract
assert
boolean
break
*/
```

运行结果如下：

```
{abstract=0, assert=0, boolean=1, break=0, byte=0, case=0, catch=0, char=0, class=2, const=0, continue=0, default=0, do=0, double=0, else=2, enum=0, extends=0, final=0, finally=0, float=0, for=2, goto=0, if=6, implements=0, import=4, instanceof=0, int=1, interface=0, long=4, native=0, new=6, package=1, private=1, protected=0, public=5, return=0, short=0, static=1, strictfp=0, super=0, switch=0, synchronized=0, this=0, throw=0, throws=2, transient=0, try=0, void=4, volatile=0, while=2}
```



*感觉还有其他的特殊情况没有进行排除*



> 参考：
>
> [正则表达式匹配引号内字符串](https://www.cnblogs.com/imjustice/p/regex_select_text_in_quota.html)
>
> [文本统计器（Java）](https://blog.csdn.net/weixin_30699831/article/details/98134285)

<br/>

## 8-2

**题目**：实现一个程序，该程序的输入是一个*目录字符串*和一个*文件扩展名*字符串，程序递归搜索该目录及各级子目录，查找与指定相同的文件，将这些文件的*相对路径名*记录下来并向控制台输出。



代码如下：

```java
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class homework_8_2 {

	public static void main(String[] args) {
		FileFinder finder = new FileFinder();
		List<String> filenameList = new ArrayList<String>();
		
		Scanner scan = new Scanner(System.in);
        System.out.println("输入目录字符串：");
        String currentDir = scan.nextLine();
        System.out.println("输入文件扩展名字符串：");
        String filenameSuffix = scan.nextLine();
        scan.close();
        
//		String currentDir = "D:\\code\\Java-XDU\\java-book-code\\book-code";
//		String filenameSuffix = ".java";
		finder.findFiles(filenameSuffix, currentDir, filenameList);
		for (String filename : filenameList) {
			System.out.println(filename.substring(currentDir.length()+1));
		}
	}

}

class FileFinder {
	public void findFiles(String filenameSuffix, String currentDir, List<String> currentFilenameList) {
		File dir = new File(currentDir);
		if (!dir.exists() || !dir.isDirectory()) {
			return;
		}

		for (File file : dir.listFiles()) {
			if (file.isDirectory()) {
				findFiles(filenameSuffix, file.getAbsolutePath(), currentFilenameList);
			} else {
				if (file.getAbsolutePath().endsWith(filenameSuffix)) {
					currentFilenameList.add(file.getAbsolutePath());
				}
			}
		}
	}
}
```

输入：

```
输入目录字符串：
D:\code\Java-XDU\java-book-code\book-code
输入文件扩展名字符串：
.java
```

![image-20201117210339852](http://framist-bucket-openread.oss-cn-shanghai.aliyuncs.com/img/2023/08/15/20230815202632.png)



输出：

```
chap01\HelloWorld.java
chap02\ArrayCopy.java
chap02\ArrayLength.java
chap02\AssignConversion.java
chap02\BinaryConversion.java
chap02\BreakAndContinueWithLabel.java
chap02\CastRoundingNum.java
chap02\CharConst.java
chap02\EnhancedFor.java
chap02\homework\Homework_2_18.java
chap02\homework\Homework_2_19.java
chap02\homework\Homework_InsertionSort.java
chap02\homework\Homework_MergeSort.java
chap02\PrimitiveConst.java
chap02\ShiftRight.java
chap02\ShortCircuit.java
chap02\UnaryConversion.java
chap02\UnaryConversion2.java
chap02\VariablesAndLocalVarInit.java
chap03\Downcasting.java
chap03\homework\homework_3_2.java
chap03\homework\homework_3_3.java
chap03\homework\homework_3_9.java
chap03\ImportStatic.java
chap03\inheritance\ConstructSubObj.java
chap03\inheritance\ConstructSubObj2.java
chap03\inheritance\TestInheritance.java
chap03\InstanceInitializer.java
chap03\NotOverriding.java
chap03\overloading\AmbiguousOverloading.java
chap03\overloading\ConstructorOverloading.java
chap03\overloading\TestOverloading.java
chap03\PackageImport.java
chap03\ParameterPass.java
chap03\pkg1\A.java
chap03\pkg1\C.java
chap03\pkg2\PrivateVsPackage.java
chap03\pkg2\ProtectedVsPackageAndPublic.java
chap03\pkg2\PublicVsPackage.java
chap03\PolyConstructor.java
chap03\Rectangle.java
chap03\Rectangle2.java
chap03\ReturnedThis.java
chap03\shape\TestShapes.java
chap03\TestClone.java
chap03\TestEquals.java
chap03\Triangle.java
chap03\UnmaskField.java
chap03\VariousArgs.java
chap04\BlankFinals.java
chap04\FinalArgs.java
chap04\FinalVariables.java
chap04\InheritStaticInit.java
chap04\inner\AnonymousInner.java
chap04\inner\Book.java
chap04\inner\DotThis.java
chap04\inner\LocalInner.java
chap04\NewEnum.java
chap04\ProductFactory.java
chap04\SeasonChange.java
chap04\Sportsman.java
chap04\StaticInitialization.java
chap04\StaticPolymorphism.java
chap04\TestEnum.java
chap04\TestShapesAbsClass.java
chap04\TestShapesInterface.java
chap04\TestStaticInit.java
chap04\TestStaticMethod.java
chap05\CollectionWithForeach.java
chap05\TestCollection.java
chap05\TestComparable.java
chap05\TestEnumMap.java
chap05\TestEnumSet.java
chap05\TestIterator.java
chap05\TestListIterator.java
chap05\TestMap.java
chap05\TestPriorityQueue.java
chap05\TestQueue.java
chap05\TestSet.java
chap05\TestShapesArrayList.java
chap06\Autoboxing.java
chap06\Immutable.java
chap06\regex\homework_6_10.java
chap06\regex\MatchGroup.java
chap06\regex\PatternMatcherTest.java
chap06\regex\PatternSplit.java
chap06\regex\Replacement.java
chap06\regex\ScannerRegex.java
chap06\regex\StringMatch.java
chap06\regex\StringReplacement.java
chap06\regex\StringSplit.java
chap06\ScannerDemo.java
chap06\SimpleFormat.java
chap06\StringBuilderDemo.java
chap06\StringImmediate.java
chap06\StringTokenizerDemo.java
chap07\HelloWorld.java
chap07\ListOfNumbers.java
chap07\TestListOfNumbersDeclared.java
chap07\TestMyException.java
chap08\BufferedIO.java
chap08\DataInputEOF.java
chap08\DataIO.java
chap08\FileCopy.java
chap08\homework_8_2.java
chap08\nio\TestMappedByteBuffer.java
chap08\nio\TestNIO.java
chap08\nio\TestNIO2.java
chap08\nio\TestNIOSimple.java
chap08\RandomAccessFileDemo.java
chap08\RenameFile.java
chap08\SerializeDate.java
chap08\StandardIO.java
chap08\UnSerializeDate.java
chap10\AddAccount.java
chap10\AddAccountSync.java
chap10\CountDown.java
chap10\CountDown2.java
chap10\CountDown3.java
chap10\CountDown4.java
chap10\GetLockAgain.java
chap10\PipedIO.java
chap10\producerconsumer\AccountProducerConsumer.java
chap10\TestJoin.java
chap10\TestStop.java
chap11\LocalHost.java
chap11\NetworkResolver.java
chap11\TCPClient.java
chap11\TCPServer.java
chap11\UDPClient.java
chap11\UDPServer.java
chap11\URLParse.java
chap11\URLRetrieve.java
chap11\URLRetrieve2.java

```





> [参考](https://www.iteye.com/blog/mouselearnjava-1959690)

