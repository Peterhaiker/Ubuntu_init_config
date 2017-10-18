#!/bin/bash

function remove_package()
{
echo -e "\033[032mremove useless package...\033[0m"
sudo apt-get remove libreoffice-common unity-webapps-common  thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjonggonboard deja-dup -y>/dev/null 
#if the previous command run error,then error message output to log file
err=$?
if (( $err != 0 ));then
    echo "移除无用软件命令执行错误，返回码:$err">>myinit.log
else
    echo -e "\033[032mdone\033[0m"
fi
}

#install vim
#add vim ppa to get latest vim
function install_config_vim()
{
echo -e "\033[032madd vim ppa and install vim...\033[0m"
sudo add-apt-repository ppa:jonathonf/vim>/dev/null&&sudo apt-get update -y>/dev/null&&sudo apt-get install vim -y>/dev/null
err=$?
if (($err != 0));then
    echo "install vim failed,return value:$err2"2>>myinit.log
    exit
else
    echo -e "\033[032mdone\033[0m"
fi
#configure vim
echo -e "\033[032mconfigure vim...\033[0m"
#step 1
sudo apt-get install vim-gtk exuberant-ctags -y>/dev/null&&rm -rf ~/.vim ~/.vimrc&&git clone https://github.com/ruchee/vimrc.git ~/vimrc&&mv ~/vimrc/vimfiles ~/.vim&&mv ~/vimrc/_vimrc ~/.vimrc&&wget https://github.com/todylu/monaco.ttf/blob/master/monaco.ttf?raw=true>/dv/null&&mv monaco.ttf ~/.fonts
if (($? != 0));then
    echo "config vim failed"2>>myinit.log
else
    echo "done"
fi
}

#install git and vpnc
function install_git_vpnc()
{
echo -e "\033[032minstall vpnc and git...\033[0m"
sudo apt-get install vpnc git -y>/dev/null
err=$?
if (($err != 0));then
    echo "install vpnc or git failed,return value:$err"2>>myinit.log
else
    echo -e "\033[032mdone\033[0m"
fi
}

#换源
function change_source()
{
sudo cp /etc/apt/sources.list /etc/apt/sources.list.cpy&&sudo cp ./sources.list /etc/apt/&&sudo apt-get update>/dev/null
if (($err != 0));then
    echo "换源失败"2>>myinit.log
else
    echo "done"
fi
}

#install sogou input 
function install_sogou_input()
{
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt-get install fcitx -y>/dev/null
sudo apt-get install fcitx-config-gtk -y>/dev/null
sudo apt-get install fcitx-table-all -y>/dev/null
sudo apt-get install im-switch -y >/dev/null
#待完成
#根据系统位数选择安装32或64的输入法
sudo apt-get install sogoupinyin -y>/dev/null
if (($? == 0));then
    echo "\033[032minstall sogoupinyin success\033[0m"
else
    echo "install sogoupinyin failed"2>>myinit.log
fi
}

#install chromium brower
function install_chromiun()
{
sudo apt-get install chromium-browser -y
if (($? == 0));then
    echo "\033[032minstall chromium brower success\033[0m"
else
    echo "install chromium brower failed"2>>myinit.log
fi
}

function install_all(){
    remove_package
    change_source
    install_git_vpnc
    install_config_vim
    install_sogou_input
    install_chromiun
sudo apt-get autoremove -y>/dev/null
sudo apt-get upgrade -y>/dev/null
echo "\033[032mCongratulation,all step finished,maybe some wrong happened if myinit.log file you see in the directory\033[0m"
}

function quit()
{
    echo "quit"
    exit
}

PS3="请选择:"
echo -e "\033[032m--------------Welcome to here---------------\033[1m" 
#echo "1)移除无用软件"
#echo "2)安装并配置vim"
#echo "3)安装git和vpnc"
#echo "4)换源"
#echo "5)安装搜狗输入法"
#echo "6)安装chromiun brower"
#echo "7)一键安装所有"
#echo "8)退出"
menu=(
"移除无用软件"
"安装并配置vim"
"安装git和vpnc"
"换源"
"安装搜狗输入法"
"安装chromiun_brower"
"一键安装所有"
"退出"
)
select i in ${menu[@]}
do
    case $i in
        ${menu[0]})
            remove_package
            ;;
        ${menu[1]})
            install_config_vim
            ;;
        ${menu[2]})
            install_git_vpnc
            ;;
        ${menu[3]})
            change_source
            ;;
        ${menu[4]})
            install_sogou_input
            ;;
        ${menu[5]})
            install_chromiun
            ;;
        ${menu[6]})
            install_all
            ;;
        ${menu[7]})
            quit
            ;;
    esac
    if [[ $i > 0 && $i < 9 ]];then
        if [ -f myinit.log ];then
            rm myinit.log
        fi
    fi
done
#把laod的hosts文件上传到github供以后下载，需要先学github
