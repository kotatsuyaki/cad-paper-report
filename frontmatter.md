---
# vim: set ft=markdown.pandoc colorcolumn=100:

title: 'Recognition of Fanout-free Functions'
subtitle: 'Presentation Report for Introduction to CAD'
author: '107021129 黃明瀧'
date: 2022-06-11
fontsize: 12pt

maketitle: true
colorlinks: true

# 引用之「圖x」
figPrefix: 圖

reference-section-title: 引用

header-includes:
#  - \addtokomafont{disposition}{\normalfont}
  - \usepackage{amsthm}
  - \newtheorem*{thm}{定理}
  - \newtheorem*{lem}{引理}
# 圖的caption的「圖x」
  - |
    ```{=latex}
    \AtBeginDocument{%
    \addto\captionsenglish{\renewcommand{\figurename}{圖}}
    }
    ```

---
