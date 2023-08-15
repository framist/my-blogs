---
title: 【Java】上机作业报告 1
categories: 
- 计算机科学
- 课业学习
- Java
tags: 
- Java
- 学习
---

# 上机报告 1

> Java 程序设计上机作业 2-18 2-19 插入排序 归并排序，支持整数或浮点数，每次输入随机生成 上机报告 (word 或 pdf)+源代码 (. java 文件)，打包为“上机作业 1-学号 - 姓名”，10 月 11 号晚上之前发到邮箱 ██████████████████


<!--more-->

<br/>

## 2-18 最大数字和的行号



题目没有给定输入输出，所以我假定是传入传出参数的方式，封装成`Array`类，使用`findMaxRow()`方法计算最大数字和的行号。并写了一个`main`用于调试。

**注：输出的行号是从 1 开始计数**

整体代码如下：

```java
package homework;

public class Homework_2_18 {
	public static void main(String[] args) {
		int[][] I = {{2, 9 },{4 ,5}};
		Array A = new Array(I);
		A.print();
		System.out.print("The max row is: ");
		System.out.println(A.findMaxRow()+1);
	}
}

class Array{
	int[][] A;
	public Array(int[][] Input){
		A = Input;
	}
	public int findMaxRow() {
		int iMax = 0;
		int max = 0;
		int sum = 0;
		for(int i = 0; i<A.length ; i++) {
			sum = 0;
			for(int j: A[i]) {
				sum += j;
			}
			if(sum > max) {
				iMax = i;
				max = sum;
			}
		}
		
		return iMax;
	}
	public void print(){
		for (int[] element1: A) {
			for (int element2: element1) {
				System.out.print(element2+" ");
			}
			System.out.println();
		};
	}
}
```





在计算和部分，我使用了 For-Each 循环，它能在不使用下标的情况下遍历数组。语法格式如下：

```java
for(type element: array)
{
    System.out.println(element);
}
```




## 2-19 吸血鬼数字

使用排序再比较的方法来判断是否是吸血鬼数字，性能不是很好但易于理解。

代码如下：

```java
package homework;

public class Homework_2_19 {

	public static void main(String[] args) {
		VampireNumbers4.findAll4(1000,9999);
	}

}
class VampireNumbers4{
	public static void findAll4(int min,int max) {
		String[] str1, str2;
        for (int i = 10; i < 100; i++) {
            for (int j = i + 1; j < 100; j++) {
                int ans = i * j;
                if (ans < 1000 || ans > 9999) {
                    continue;
                }
                str1 = String.valueOf(ans).split("");
                str2 = (String.valueOf(i) + String.valueOf(j)).split("");
                java.util.Arrays.sort(str1);
                java.util.Arrays.sort(str2);
                if (java.util.Arrays.equals(str1, str2)) {
                    System.out.println(i + "*" + j + "=" + ans);
                }
            }
        }
	}
}
```

但这此方法只适用于四位数的情况，有待改进。





## 插入排序

经典的插入排序。

用重载的方法分别处理整数和浮点数的输入

代码如下：

```java
package homework;

import java.util.Scanner;
import java.util.regex.Pattern;

public class Homework_InsertionSort {

	public static void main(String[] args) {
		// 读取数组
		Scanner sc = new Scanner(System.in);
		String str = sc.nextLine().toString();
		String arr[] = str.split(" ");
		// 整数 浮点数 分开处理
		if(isInteger(arr[0])) {
			int a[] = new int[arr.length];
			for (int j = 0; j < a.length; j++) {
				a[j] = Integer.parseInt(arr[j]);
			}
			insertionSort(a);
			for (int j = 0; j < a.length; j++) {
				System.out.print(a[j] + " ");
			}
		}else if (isDouble(arr[0])) {
			double a[] = new double[arr.length];
			for (int j = 0; j < a.length; j++) {
				a[j] = Double.parseDouble(arr[j]);
			}
			insertionSort(a);
			for (int j = 0; j < a.length; j++) {
				System.out.print(a[j] + " ");
			}
		}else {
			//非法输入
			;
		}
		sc.close();
	}

	private static boolean isInteger(String str) {
		if (null == str || "".equals(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}

	private static boolean isDouble(String str) {
		if (null == str || "".equals(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("^[-\\+]?\\d*[.]\\d+$");
		return pattern.matcher(str).matches();
	}
	
	private static void insertionSort(int[] a) {
		// 升序排列
		int N = a.length;
		for (int i = 1; i < N; i++) {
			for (int j = i; j > 0 && (a[j] < a[j - 1]); j--) {
				int temp = a[j];
				a[j] = a[j - 1];
				a[j - 1] = temp;
			}
		}
	}
	private static void insertionSort(double[] a) {
		// 升序排列
		double N = a.length;
		for (int i = 1; i < N; i++) {
			for (int j = i; j > 0 && (a[j] < a[j - 1]); j--) {
				double temp = a[j];
				a[j] = a[j - 1];
				a[j - 1] = temp;
			}
		}
	}
}
```


## 归并排序

递归实现的并归排序。

用重载的方法分别处理整数和浮点数的输入。

代码如下：

```java
package homework;

import java.util.Scanner;
import java.util.regex.Pattern;

public class Homework_MergeSort {

	public static void main(String[] args) {
		// 读取数组
		Scanner sc = new Scanner(System.in);
		String str = sc.nextLine().toString();
		String arr[] = str.split(" ");
		// 整数 浮点数 分开处理
		if(isInteger(arr[0])) {
			int a[] = new int[arr.length];
			for (int j = 0; j < a.length; j++) {
				a[j] = Integer.parseInt(arr[j]);
			}
		    int len = arr.length;
		    int[] result = new int[len];
		    mergeSort(a, result, 0, len - 1);
			for (int j = 0; j < a.length; j++) {
				System.out.print(a[j] + " ");
			}
			
		}else if (isDouble(arr[0])) {
			double a[] = new double[arr.length];
			for (int j = 0; j < a.length; j++) {
				a[j] = Double.parseDouble(arr[j]);
			}
		    int len = arr.length;
		    double[] result = new double[len];
		    mergeSort(a, result, 0, len - 1);
			for (int j = 0; j < a.length; j++) {
				System.out.print(a[j] + " ");
			}
			
		}else {
			//非法输入
			;
		}
		sc.close();
	}

	private static boolean isInteger(String str) {
		if (null == str || "".equals(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		return pattern.matcher(str).matches();
	}

	private static boolean isDouble(String str) {
		if (null == str || "".equals(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("^[-\\+]?\\d*[.]\\d+$");
		return pattern.matcher(str).matches();
	}
	

	static void mergeSort(int[] arr, int[] result, int start, int end) {
	    if (start >= end)
	        return;
	    int len = end - start, mid = (len >> 1) + start;
	    int start1 = start, end1 = mid;
	    int start2 = mid + 1, end2 = end;
	    mergeSort(arr, result, start1, end1);
	    mergeSort(arr, result, start2, end2);
	    int k = start;
	    while (start1 <= end1 && start2 <= end2)
	        result[k++] = arr[start1] < arr[start2] ? arr[start1++] : arr[start2++];
	    while (start1 <= end1)
	        result[k++] = arr[start1++];
	    while (start2 <= end2)
	        result[k++] = arr[start2++];
	    for (k = start; k <= end; k++)
	        arr[k] = result[k];
	}
	static void mergeSort(double[] arr, double[] result, int start, int end) {
	    if (start >= end)
	        return;
	    int len = end - start, mid = (len >> 1) + start;
	    int start1 = start, end1 = mid;
	    int start2 = mid + 1, end2 = end;
	    mergeSort(arr, result, start1, end1);
	    mergeSort(arr, result, start2, end2);
	    int k = start;
	    while (start1 <= end1 && start2 <= end2)
	        result[k++] = arr[start1] < arr[start2] ? arr[start1++] : arr[start2++];
	    while (start1 <= end1)
	        result[k++] = arr[start1++];
	    while (start2 <= end2)
	        result[k++] = arr[start2++];
	    for (k = start; k <= end; k++)
	        arr[k] = result[k];
	}

}

```





