---
title: XDSEC个人周报0x04
categories: 
- 计算机科学
- 网络安全
- 个人周报
tags: 
- 信息安全
- 周报
---

# XDSEC个人周报0x04


- [ ] ~~这周的事儿，就下周再做吧~~

<!--more-->

# Web

[《如果让你来设计网络》](http://mp.weixin.qq.com/s?__biz=Mzk0MjE3NDE0Ng==&mid=2247489907&idx=1&sn=a296cb42467cab6f0a7847be32f52dae&chksm=c2c663def5b1eac84b664c8c1cadf1c8ec23ea2e57e48e04add9b833c841256fc9449b62c0ec&scene=21#wechat_redirect)

[你管这破玩意儿叫TCP？](https://mp.weixin.qq.com/s?__biz=Mzk0MjE3NDE0Ng==&mid=2247491962&idx=1&sn=aa4414483edaba487c080e91ad0efb93&chksm=c2c59bd7f5b212c12231394c585f3b063b0b2d5b05d6f05fddccdb4e856875e7ee1127bb30a7&mpshare=1&scene=23&srcid=0121ofhK0lA2TnwYQBHqXQt3&sharer_sharetime=1611197108861&sharer_shareid=e70d4a6034d20df60c0eb795b3edf7ad#rd)

## Python格式化字符串漏洞

*python >= 3.6*

[基础知识](https://www.cnblogs.com/traditional/archive/2004/01/13/9217594.html)

示例：

```python
# str = '{"a":"1", "b": 2}'
# json_data = eval(str)
#
# print(type(json_data))
# print(json_data)


evil_str = '{"a": f"test {__import__(\'os\').system(\'whoami\')}"}'
json_data = eval(evil_str)

print(type(json_data))
print(json_data)
```



## Web组会作业

> 用python实现一个简单的模版渲染，比如可以用replace/正则+eval，并试着编写一个可以执行ls命令的模版。不用写得太复杂，100行以内

