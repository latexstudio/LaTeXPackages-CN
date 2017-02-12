# pgf - Create PostScript and PDF graphics in TeX

http://ctan.org/pkg/pgf


PGF是用于生成图的宏包。它独立于平台和格式，与最重要的TeX终端驱动共同工作，包括pdfTeX和dvips。与之并生的用户友好的语法层TikZ。

它的用法同于pstricks和标准图环境。PGF在plain (pdf-)TeX，(pdf-)LaTeX，和ConTeXt中均有效。和pstrics不同的是，它可以生成PostScript或PDF输出。


本项目文档来自于：http://mirrors.ctan.org/install/graphics/pgf/base/pgf.tds.zip

在zip压缩包中`/doc/generic/pgf/`含有所有手册原文件，置于`doc-en`中，相应的中文翻译在`doc-zh`中。

# 进度

- 2016.2.12 建立本项目文档。


# 文档结构

- 每种编译版本文档，在`version-for-XXX`之中。
- 文档正文在`text-en`中，也正是我们翻译的目标内容。

# 操作

## 翻译
- [X] Introduction
- [ ] Tutorials and Guidelines
   + [ ] Tutorial: A Picture for Karl’s Students

## 编译
Till Tantau为我们提供了非常便捷的编译方式——`Makefile`(在每个版本文件夹中，如`/doc-zh/version-for-xetex/en/`)：

- 在终端键入命令`make`即实现编译。
- 键入`make clean`即清除临时文件。

