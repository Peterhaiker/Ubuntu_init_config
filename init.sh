#!/bin/bash
0>/dev/null
echo -e "\033[032m--------------Welcome to here---------------\033[0m"
echo -e "\033[032mremove useless package...\033[0m"
sudo apt-get remove libreoffice-common unity-webapps-common  thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjonggonboard deja-dup -y>/dev/null

#if the previous command run error,then error message output to log file
err=$?
if (( $err != 0 ));then
    echo "移除无用软件命令执行错误，返回码:$err">>myinit.log
else
    echo -e "\033[032mdone\033[0m"
fi

#install vim
#add vim ppa to get latest vim
echo -e "\033[032madd vim ppa and install vim...\033[0m"
sudo add-apt-repository ppa:jonathonf/vim>/dev/null
err1=$?
sudo apt-get update -y>/dev/null
sudo apt-get install vim -y>/dev/null
err2=$?
if (($err1 != 0));then
    echo "add vim ppa failed,return value:$err1"2>>myinit.log
elif (($err2 != 0));then
    echo "install vim failed,return value:$err2"2>>myinit.log
else
    echo -e "\033[032mdone\033[0m"
fi

#install git and vpnc
echo -e "\033[032minstall vpnc and git...\033[0m"
sudo apt-get install vpnc git -y>/dev/null
err=$?
if (($err != 0));then
    echo "install vpnc or git failed,return value:$err"2>>myinit.log
else
    echo -e "\033[032mdone\033[0m"
fi
#configure vim

echo -e "\033[032mconfigure vim...\033[0m"
#step 1
sudo apt-get install vim-gtk exuberant-ctags -y>/dev/null
if (($? == 0));then
    echo "\033[032minstall vim-gtk exuberant-ctags success\033[0m"
else
    echo "install vim-gtk exuberant-ctags failed"2>>myinit.log
fi
#step 2
rm -rf ~/.vim ~/.vimrc
if (($? == 0));then
    echo "\033[032mrm ~/.vim ~/.vimrc success\033[0m"
else
    echo "rm ~/.vim ~/.vimrc failed"2>>myinit.log
fi
#step 3
git clone https://github.com/ruchee/vimrc.git ~/vimrc
if (($? == 0));then
    echo "\033[032m git clone success\033[0m"
else
    echo "git clone failed"2>>myinit.log
fi
#step 4
mv ~/vimrc/vimfiles ~/.vim
if (($? == 0));then
    echo "\033[032mmv ~/vimrc/vimfiles to ~/.vim success\033[0m"
else
    echo "mv ~/vimrc/vimfiles to ~/.vim failed"2>>myinit.log
fi
#step 5
mv ~/vimrc/_vimrc ~/.vimrc
if (($? == 0));then
    echo "\033[032mmv ~/vimrc/_vimrc to ~/.vimrc success\033[0m"
else
    echo "mv ~/vimrc/_vimrc to ~/.vimrc failed"2>>myinit.log
fi
#step 6
wget https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf?raw=true>/dv/null
#step 7
mv monaco.ttf ~/.fonts

#换源
sudo cp /etc/apt/sources.list /etc/apt/sources.list.cpy
sudo cp ./sources.list /etc/apt/
sudo apt-get update>/dev/null

#install sogou input 
sudo apt-get install sogoupinyin -y>/dev/null
if (($? == 0));then
    echo "\033[032minstall sogoupinyin success\033[0m"
else
    echo "install sogoupinyin failed"2>>myinit.log
fi

#install chromium brower
sudo apt-get install chromium-browser -y
if (($? == 0));then
    echo "\033[032minstall chromium brower success\033[0m"
else
    echo "install chromium brower failed"2>>myinit.log
fi

sudo apt-get autoremove -y>/dev/null
sudo apt-get upgrade -y>/dev/null
echo "\033[032mCongratulation,all step finished,maybe some wrong happened if myinit.log file you see in the directory\033[0m"

#把laod的hosts文件上传到github供以后下载，需要先学github
