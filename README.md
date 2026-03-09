# ThinkIR - Think Intermediate Representation, TIR

使用自然语言来进行人类和LLM间的对话是低效率的，因为自然语言是弱逻辑和低熵的。
我们需要一种强逻辑性并且对LLM友好的输入语言，使用伪代码来操控LLM的思维链和输出结果。

## About ThinkIR

我们设计了一个被称为ThinkIR的脚本语言，它介于自然语言和编程语言之间。用于将 Vibe Coding 变得精细化和可控制，而不是由LLM随机产生垃圾代码。将ThinkIR.txt输入给LLM，即可让LLM进入ThinkIR模式。

## Quick Start with Gemini

**将ThinkIR.txt输入给LLM，或是将ThinkIR.txt中的内容粘贴并输入给LLM，即可进入ThinkIR模式。**

<img width="587" height="1195" alt="image" src="https://github.com/user-attachments/assets/b15f74b0-f4d8-4c4b-b5f5-4befce15ef0b" />


## Instructions
LLMctx 是基本数据对象，它有以下方法：

| 方法 | 效果 |
| --- | --- |
| think | 思考 |
| st | 强约束 |
| bind | 逻辑绑定 |
| keyword | 每次思考时回顾 |
| purpose | 思考的主题 |
| push | 压栈输出 |
| create | 生成文档 |
| program | 生成程序 |

## Principles

* ThinkIR是基于C++的伪代码，我们要求ThinkIR是合法的C++代码、符合C++代码规范。
* 将ThinkIR作为提示词输入到LLM，能更精确地控制思维链和生成结果。
* 自然语言 --> LLM生成ThinkIR -> 人工调整ThinkIR -> LLM执行ThinkIR并输出Vibe Coding结果
* 将ThinkIR.txt输入到LLM，LLM即可进入ThinkIR模式。
* ThinkIR.txt实现了翻译功能，使得LLM可以将人类语言翻译成ThinkIR脚本。
* ThinkIR.txt实现了执行功能，使得LLM可以按照ThinkIR脚本的逻辑流生成输出结果。
* 输入ThinkIR.txt后默认进入命令行模式，自然语言输入会先被翻译成ThinkIR，然后再执行ThinkIR产生输出结果。所有自然语言输入会先被LLM翻译成ThinkIR，然后再执行ThinkIR产生输出结果。
* 如果想要逃离ThinkIR模式，使用注释输入（将输入用//或者/**/包裹），或者使用自然语言命令“退出ThinkIR模式”。
* 



