# 安装

1. 所有平台
```bash
cd
git clone https://github.com/lyallchan/.vimrc.git .vim
```

2. windows/cygwin
在$HOME下新增.vimrc文件，内容为
```vim
if has("win32")
    set rtp-=$HOME/vimfiles
    set rtp-=~/vimfiles/after
    set rtp+=$HOME/.vim
    set rtp+=$HOME/.vim/after
endif
runtime! vimrc/.vimrc
```

3. mac/linux
在$HOME下新增.vimrc软链接，指向真正的.vimrc文件
```bash
cd
ln -s .vimrc .vim/vimrc/.vimrc
```

# 2015-09-25 15:07 
## 包含插件
| 序号 | 名称        | 说明                                                                          |
|------|-------------|-------------------------------------------------------------------------------|
| 1.   | ahk         | 自定义插件，增加ahk文件的注释字符                                             |
| 2.   | commentary  | gc{motion}开关注释，gcc开关当前行注释                                         |
| 3.   | delimitMate | 自动插入匹配的引号、括号等                                                    |
| 4.   | easymotion  | 没什么用，已经用pathogen的blacklist禁用                                       |
| 5.   | fugitive    | git工具，目前只是配合lightline显示git的分支状态                               |
| 6.   | lightline   | status  line增强工具                                                          |
| 7.   | markdown    | markdown高亮，`[[`、`]]`上一标题和下一标题，自定义了增加todo和序号功能        |
| 8.   | matchit     | 增强的匹配跳转，可以跳转html的tag，还在.vimrc中，用<tab>代替`%`               |
| 9.   | nerdtree    | 不说了，太有名了                                                              |
| 10.  | repeat      | 增强的`.`功能，和surround配合使用                                             |
| 11.  | showmarks   | 显示marks标记                                                                 |
| 12.  | supertab    | <tab>自动完成，在所有buffers中寻找                                            |
| 13.  | surround    | 增删改包围符号，包括'<(以及html标记。`ys{textobject}`、`ds{textobject}`       |
| 14.  | table-mode  | vim画表格，<leader>tt转换文字到表格，表格标记触发on_fly画表格                 |
| 15.  | tabular     | 文本对齐，`:Tabularize /{char}`，按照`char`对齐                               |
| 16.  | tagbar      | 动态生成tag窗格，`:Tagbar`                                                    |
| 17.  | tasklist    | `<leader>k`，自动寻找<todo>标记，并生成新窗口，配合markdown中自定义的todo功能 |
| 18.  | undotree    | 没什么用，已经用pathogen的blacklist禁用                                       |
| 19.  | vimcdoc     | 中文vim帮助，有用                                                             |


