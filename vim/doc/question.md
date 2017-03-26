# 安装过程的问题解答

1. (Vim8.0)源码编译安装,在配置过程(检查依赖关系)可能会碰到下面的问题
```
no terminal library found
checking for tgetent()… configure: error: NOT FOUND!
      You need to install a terminal library; for example ncurses.
      Or specify the name of the library with –with-tlib.
ncurses是一个比较老的库

解决方法：sudo apt install libncurses5-dev
```
