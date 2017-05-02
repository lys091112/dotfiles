#!/bin/bash

zshFile="~/.zshrc"

basepath=$(cd `dirname $0`; pwd)

sudo apt-get install zsh

#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sh $basepath/install_zsh.sh


if [ -f "$zshFile" ]; then
    cp ~/.zshrc ~/.zshrc.orig
fi

sudo chsh -s /bin/zsh

#cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
cp $basepath/color/honukai.zsh-theme ~/.oh-my-zsh/themes/

ln -sf $basepath/zshrc ~/.zshrc

sh $basepath/install_wd.sh


