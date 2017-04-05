#!/bin/bash

zshFile="~/.zshrc"

sudo apt-get install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

if [ -f "$zshFile" ]; then
    cp ~/.zshrc ~/.zshrc.orig
fi

cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

chsh -s /bin/zsh
