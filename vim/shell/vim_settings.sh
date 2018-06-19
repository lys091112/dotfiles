#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

basepath = $(cd `dirname $0` | pwd)
echo "$bashpath"

#复制配色文件
sudo cp $bashpath/../colors/molokai.vim ~/.vim/colors/

# 链接vim配置文件
ln -sf ~/xianyue/doc/dotfiles/vim/vimrc ~/.vimrc


