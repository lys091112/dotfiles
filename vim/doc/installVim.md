# 安装vim

    
## 插件安装

### YouCommleteMe

    在~/.vimrc中添加一行：
    Plugin 'Valloric/YouCompleteMe'
    保存退出后，再打开/etc/vimrc并执行 :PluginInstall。
    然后cd到.vim/bundle/YouCompleteMe 执行：git submodule update –-init –-recursive

## 参数配置

    "golang
    - 新起一行输入fmt.，然后ctrl+x, ctrl+o，Vim 会弹出补齐提示下拉框，不过并非实时跟随的那种补齐，这个补齐是由gocode提供的。
    -– 输入一行代码：time.Sleep(time.Second)，执行:GoImports，Vim会自动导入time包。
    -– 将光标移到Sleep函数上，执行:GoDef或命令模式下敲入gd，Vim会打开$GOROOT/src/time/sleep.go中 的Sleep函数的定义。执行:b 1返回到hellogolang.go。
    -– 执行:GoLint，运行golint在当前Go源文件上。
    -– 执行:GoDoc，打开当前光标对应符号的Go文档。
    -– 执行:GoVet，在当前目录下运行go vet在当前Go源文件上。
    -– 执行:GoRun，编译运行当前main package。
    -– 执行:GoBuild，编译当前包，这取决于你的源文件，GoBuild不产生结果文件。
    -– 执行:GoInstall，安装当前包。
    -– 执行:GoTest，测试你当前路径下地_test.go文件。
    -– 执行:GoCoverage，创建一个测试覆盖结果文件，并打开浏览器展示当前包的情况。
    -– 执行:GoErrCheck，检查当前包种可能的未捕获的errors。
    -– 执行:GoFiles，显示当前包对应的源文件列表。
    -– 执行:GoDeps，显示当前包的依赖包列表。
    -– 执行:GoImplements，显示当前类型实现的interface列表。
    -– 执行:GoRename [to]，将当前光标下的符号替换为[to]

### rst_table.vim  Allows to create and edit restructuredText tables easily
```
	Install the python extension to vim and then copy the file `rst_table.vim` 
    to the `.vim/plugin` directory in your home directory. 

	This plugin allows to create and edit restructuredText tables easily. 
	Its adds two new commands: 
       ,,c  ->  Creates a new restructuredText table. 
	   ,,f  ->  Fix table columns in a table. 
    example:
    //中间要以2个空格分割会被当作一个column
    column1  column2  column3
    hello  world  call

```

