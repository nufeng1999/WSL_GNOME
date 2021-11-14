![](https://img.shields.io/badge/WSL-GUI-green) ![](https://img.shields.io/badge/Cygwin-XWin-orange) ![](https://img.shields.io/github/watchers/nufeng1999/WSL_GNOME) <img alt="ViewCount" src="https://views.whatilearened.today/views/github/nufeng1999/WSL_GNOME.svg">
    <a href="https://github.com/nufeng1999/wsl_XWin_Cygwin"><img alt="GitHub Clones" src="https://img.shields.io/badge/dynamic/json?color=success&label=Clone&query=count&url=https://raw.githubusercontent.com/nufeng1999/WSL_GNOME/master/clone.json&logo=github"></a>  
# WSL_GNOME  
# Windows & Linux GUI Mix WSL GNOME Desktop  
Use Cygwin's xwin to run WSL GNOME Desktop  

ISwitch.exe --- Contrl app window maxsize,Resolving windows and WSL gui app input method conflicts  

ISwitch.exe -c  --- Resolving windows and WSL gui app input method conflicts  

ISwitch.exe -w  --- Contrl app window maxsize  

ISwitch.exe -s  --- Move task to background( default -c -w)  

[![Watch the video](https://github.com/nufeng74/wsl_XWin_Cygwin/blob/main/20210612_071703.gif?raw=true)](https://youtu.be/iy8j-fD82aQ)  

<iframe src="//player.bilibili.com/player.html?aid=336724603&bvid=BV1CR4y1t7ZY&cid=441798601&page=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>  


# Install  
Executing Windows terminal with administrator  

apt install gedit fcitx fcitx-config-gtk  fcitx-sunpinyin fcitx-pinyin  fcitx-googlepinyin xfonts-intl-chinese  

apt install xfonts-wqy xfonts-unifont fonts-wqy*  

apt install language-pack-gnome-zh-hans language-pack-kde-zh-hans language-pack-zh-hans  

apt install daemonize gnome  

mkdir /opt/WSL  

cd /opt/WSL  

git clone https://github.com/nufeng1999/WSL_GNOME.git --recurse-submodules

or  

git clone git://github.com/nufeng1999/WSL_GNOME.git --recurse-submodules

cd WSL_GNOME  

chmod +x ./install.sh;./install.sh
# Close WSL
DOS/PowerShell  

wsl --shutdown  

# reopening WSL  
wsl -u root -d Ubuntu  

// execute gnome  
wsl2-systemd  
gnome-session &  


***
If you feel that these contents are helpful to you, you can make friendly sponsorship to developers.You may get more help after sponsorship

如果你感觉这些内容对你有所帮助，可以向开发者进行友情赞助。赞助后你将可能获得更多帮助。  
群名称：  
WSL_XWin_Cygwin  
群   号：  
1014866104  

<img src="https://nufeng1999.github.io/imgs/wxzf.png"/>
WeChat Pay（微信方式赞助）
  
<img src="https://nufeng1999.github.io/imgs/zfbzf.png"/>
Alipay（支付宝方式赞助）  
  
<img src="https://nufeng1999.github.io/imgs/img/WSL_XWin_Cygwin.png"/>  
QQ群
