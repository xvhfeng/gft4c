# gft4c

## 功能说明 

gft4c是一款为C语言开发者提供的小工具。用来为C语言程序生成函数声明列表。   
比如，我们有c源码文件如下：
```
spx_private void do_something1(int varg1,int varg2){
  //some code 
}

spx_private void do_something2(int varg1,int varg2){
  //some code 
}

spx_private void do_something3(int varg1,int varg2){
  //some code 
}

spx_private void do_something4(int varg1,int varg2){
  //some code 
}

spx_public void do_something5(int varg1,int varg2){
  //some code 
}

spx_public void do_something6(int varg1,int varg2){
  //some code 
}

spx_public void do_something7(int varg1,int varg2){
  //some code 
}
```
然后根据c语言函数的特性，必须先声明再使用。故一般我们都会在c文件的开头，最后一行\#include的下面声明函数，如上面的代码，声明函数列表如下：
```
spx_private void do_something1(int varg1,int varg2)；

spx_private void do_something2(int varg1,int varg2)；

spx_private void do_something3(int varg1,int varg2)；

spx_private void do_something4(int varg1,int varg2)；
```
而在h文件中，声明公共的函数，如下：
```
spx_public void do_something5(int varg1,int varg2）；

spx_public void do_something6(int varg1,int varg2)；

spx_public void do_something7(int varg1,int varg2)；
```

在实际开发中，一般函数声明需要我们一个一个的重新写或者是从写好的函数签名copy过去，再或者是到\#include行下面写一行函数声明，再到文件下方写函数定义。
不管使用哪种方法，都会显得哼繁琐。然后**gft4c**即为此而生。   

**gtf4c提供了开发者安心写函数定义，然后使用gft4c命令GenFuncTitle即可在c文件的最后一个\#include行下面生成函数声明。**

## 使用方法
1. 确保vim支持python，若不确定，请查看相关vim安装时的扩展；     
2. 使用任一一种vim插件包管理器，将此插件安装到本地；如使用vundle,在vimrc中请加入'Plugin \'xvhfeng/gft4c\'';    
3. 在vim中运行明白BundleInstall，将自动安装此扩展    
4. 安装完毕，重启vim;    
5. 打开任一c文件，执行命令:GenFuncTitle，即可看到在\#include行下面已经生成的函数声明列表；    
6. 注意：私有函数列表和公有函数列表都会在c文件中生成，因为.h文件不一定和c文件在同一目录下，所以请开发者执行将公有函数列表copy到h文件中；    
7. 生成函数列表的时候不会区分已经存在的函数声明，故需要注意；    

## 配置
  gft4c的配置只有2个，分别是g:spkx_private和g:spkx_public。这2个配置配置项如下：
  1. g:spkx_private：配置函数为私有的起始标志位，默认为static或者是spx_private，不能为空；    
  2. g:spkx_public：配合函数为公有的起始标志位，默认为spx_public,不能为空；
  说明：
  spx_private和spx_public都是自定义的宏，定义分别如下：
  ```
  #define spx_private static
  #define spx_public
  ```










