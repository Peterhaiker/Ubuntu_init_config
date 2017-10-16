#!/bin/bash

sudo apt-get remove libreoffice-common unity-webapps-common  thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjonggonboard deja-dup -y

#install vim
#add vim ppa to get latest vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt-get update 
sudo apt-get install vim -y

#install git and vpnc
sudo apt-get install vpnc git -y

#configure vim
sudo apt-get install vim-gtk exuberant-ctags git -y
rm -rf ~/.vim ~/.vimrc
git clone https://github.com/ruchee/vimrc.git ~/vimrc
mv ~/vimrc/vimfiles ~/.vim
mv ~/vimrc/_vimrc ~/.vimrc
wget https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf?raw=true 
mv monaco.ttf ~/.fonts

#install sogou input 
deb http://archive.ubuntukylin.com:10006/ubuntukylintrusty main
sudo apt-get update
sudo apt-get install sogoupinyin

#install chromium brower
sudo apt-get install chromium-browser -y

sudo apt-get autoremove -y
sudo apt-get upgrade -y

#把laod的hosts文件上传到github供以后下载，需要先学github
#换源
