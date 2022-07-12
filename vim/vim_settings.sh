#!/bin/bash

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [[ ! -e ~/.vim/bundle/Vundle.vim ]]; then
    echo "下载Vundle失败"
    exit
fi

basepath=$(cd `dirname $0`; pwd)
echo "$basepath"

vimcolorPath="$HOME/.vim/colors/"
if [[ ! -d $vimcolorPath ]]; then
	mkdir -p $vimcolorPath

fi

#复制配色文件
sudo cp $basepath/colors/molokai.vim $vimcolorPath

# 链接vim配置文件
ln -sf $basepath/vimrc $HOME/.vimrc


