![](https://img.shields.io/badge/WSL-GUI-green) ![](https://img.shields.io/badge/Cygwin-XWin-orange) ![](https://img.shields.io/github/watchers/nufeng1999/WSL_GNOME) <img alt="ViewCount" src="https://views.whatilearened.today/views/github/nufeng1999/WSL_GNOME.svg">
# WSL_GNOME  
# Windows & Linux GUI Mix WSL GNOME Desktop  
Use Cygwin's xwin to run WSL GNOME Desktop  

ISwitch.exe --- Contrl app window maxsize,Resolving windows and WSL gui app input method conflicts  

ISwitch.exe -c  --- Resolving windows and WSL gui app input method conflicts  

ISwitch.exe -w  --- Contrl app window maxsize  

ISwitch.exe -s  --- Move task to background( default -c -w)  

[![Watch the video](https://github.com/nufeng74/wsl_XWin_Cygwin/blob/main/20210612_071703.gif?raw=true)](https://youtu.be/iy8j-fD82aQ)  

![](https://github.com/nufeng1999/imgs/blob/main/img/20211115_110932.gif?raw=true)
![](https://github.com/nufeng1999/imgs/blob/main/img/20211115_111705.gif?raw=true)
![](https://github.com/nufeng1999/imgs/blob/main/img/20211115_112440.gif?raw=true)

# Install  
Important Notice :  
1.Executing Windows terminal with administrator  
2.Executing WSL with root (wsl -u root -d Ubuntu )  
  
su - root  

apt install net-tools hwdata gedit  
apt install fcitx fcitx-config-gtk  fcitx-sunpinyin fcitx-pinyin  fcitx-googlepinyin xfonts-intl-chinese  
apt install xfonts-wqy xfonts-unifont fonts-wqy*  
  
##It depends on the version  
apt install linux-tools-5.4.0-77-generic  

apt install language-pack-gnome-zh-hans language-pack-kde-zh-hans language-pack-zh-hans  
apt install daemonize gdm3 gnome 

mkdir /opt/WSL  

cd /opt/WSL  

git clone https://github.com/nufeng1999/WSL_GNOME.git --recurse-submodules

or  

git clone git://github.com/nufeng1999/WSL_GNOME.git --recurse-submodules

cd WSL_GNOME/cygwin-auto-install    
git checkout master  
cd ../   

### Install  WSL_GNOME  

chmod +x ./install.sh   
./install.sh   
OR   
./install.sh -c "C:\\\\cygwin64" -i "C:\\\\ISwitch"  
OR  
./install.sh --cygwindir="C:\\\\cygwin64" --iswitchdir "C:\\\\ISwitch"  

   
0.67.6+version of wsl already supports systemd  
Edit the file /etc/wsl.conf  
[boot]  
systemd=true  
  
# Close WSL
DOS/PowerShell  

wsl --shutdown  

# reopening WSL  
wsl -u root -d Ubuntu  

// execute gnome  
~~wsl2-systemd~~  
~~gnome-session &~~   

startgnome2


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
