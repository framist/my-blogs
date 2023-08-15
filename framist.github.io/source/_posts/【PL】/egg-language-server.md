---
title: egg language server on VSCode
date: 2023-8-14 20:12:55
tags: 
- PL
categories: 
- 计算机科学
---

# 用蛋消灭魔鬼！编写时源码优化插件

<div align="center">
  <img width="150" heigth="150" src="https://raw.githubusercontent.com/framist/egg-language-server/main/doc/asserts/icon.svg">
  <h1>egg-language-server</h1>
  <b>🧪 in developing</b><br/>
  <i>Source Code Optimization Tools at Writing-time</i><br/>
</div>

<!-- more -->

## 特性

<iframe src="//player.bilibili.com/player.html?aid=489702942&bvid=BV1MN411z7WU&cid=1232858697&page=1&autoplay=0&danmaku=0" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" width="100%" height="100%"> </iframe>


egg-language-server 包括一个语言服务器及一个 Visual Studio Code 插件。它是一个在代码编写时环境的代码静态分析工具，借助 [egg](https://egraphs-good.github.io/) 从逻辑层面化简源码，能交互式地提供优化指导。目前支持 lisp、Python、JavaScript 语言的**子集**，未来预计会支持更多语言。目前，它在 Python 上工作最好。


egg 的源码优化主要分为以下过程：

1. Code -> AST：基于 Tree-sitter
2. AST -> IR：针对特定目标语言分别实现的 `ast_to_sexpr`
3. IR <-> IR: 构造基本元素抽象、过程抽象和数据抽象的 `CommonLanguage`。通过 egg 进行 Rewrite。
4. IR -> AST：Common Language 自动派生方法
5. AST -> Code：针对特定目标语言分别实现的 `rpn_to_human`

详见 [Slide](https://github.com/framist/egg-language-server/blob/main/doc/slide.pdf)

> 仓库地址：[framist/egg-language-server (github.com)](https://github.com/framist/egg-language-server)
> 
> 求小星星♥(ˆ◡ˆԅ)

