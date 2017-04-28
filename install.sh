#!/bin/bash

########Vim############

bashpath=$(cd `dirname $0`; pwd)
echo "now path: $bashpath"

propertiesFile="install.properties"
if [ -n "$1" ] ;then
    propertiesFile=$1
fi

echo "properties file $bashpath/$propertiesFile"

#choice = $1 #choice
#ln -sf $bashpath/vim/vimrc ~/.vimrc

install() {
    case $1 in 
        VIM8|vim8)
        echo "install vim8"
        ;;
        ZSH|zsh)
        echo "install zsh"
        sh ./zshrc/install_total.sh
        ;;
    esac
}

while read line; do 
    tmp=$(echo $line | grep "#")
    if [ ! -n "$tmp" ]; then
        install $line
    fi
done < $bashpath/$propertiesFile



