### 个人初始化UBUNTU的配置脚本
每次装完ubuntu后总要花大量时间去配置，自定义啥的，觉得太麻烦。于是用脚本来一键完成，shell编程还处于起步阶段，我在一遍学习一边改进。这也算是一举两得了，此脚本功能有如下：  
* 移除无用软件  
* 增加了vim最新源可以直接用apt安装8.0版本  
* 安装vim  
* 安装vpnc,git  
* 配置vim，配置文件来自[点此跳转](https://github.com/ruchee/vimrc)  
* 换源  
* 安装sogou拼音  
* 安装chromium浏览器  
* 最后更新系统中所有软件  
#### 配置方法  
```
git clone https://github.com/Peterhaiker/Ubuntu_init_config.git
cd Ubuntu_init_config
chmod u+x init.sh
./init.sh
```
#### 错误查看  
若发生错误，会在Ubuntu_init_config目录下创建一个myinit.log文件用于保存错误信息，查看一下就指导错在哪一步，然后只能由您手动完成那个安装了
