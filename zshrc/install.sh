#!/bin/bash

zshFile="$HOME/.zshrc"

basepath=$(cd `dirname $0`; pwd)

#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# https://ipaddress.com/website/raw.githubusercontent.com 提取可用的ip地址，然后添加host后安装
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [[ ! -e $HOME/.oh-my-zsh ]]; then 
    echo "下载ohmyzsh失败！"
    exit 
fi


if [[ -f "$zshFile" ]]; then
    cp ~/.zshrc ~/.zshrc.orig
fi

sudo chsh -s /bin/zsh

# install wd
yay -S zsh-plugin-wd-git

#
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
# 自动补全
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 语法高亮
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#p ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
if [ ! -d "$HOME/.oh-my-zsh/themes/" ]; then
    mkdir -p $HOME/.oh-my-zsh/themes/ 
fi

cp $basepath/color/honukai.zsh-theme $HOME/.oh-my-zsh/themes/

sudo ln -sf $basepath/zshrc $HOME/.zshrc



