#!/bin/bash


sudo apt-get remove vim vim-runtime gvim vim-tiny vim-common

sudo apt-get install libncurses5-dev

sudo apt-get install eui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial 

git clone https://github.com/vim/vim.git
cd ./vim

./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux/ --enable-perlinterp --enable-gui=gtk2 --enable-cscope --enable-luainterp --enable-multibyte --enable-xim --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim80

sudo make install
