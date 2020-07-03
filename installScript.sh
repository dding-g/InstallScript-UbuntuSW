#!/bin/bash

# mirror server change
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
#========================================

sudo apt update -y
sudo apt install -y vim git curl gnome-tweaks
sudo apt upgrade -y
sudo apt autoremove -y
git config --global user.email ""
git config --global user.name ""

#keyboard input rate
xset r rate 180

# uim & byeoru, for korean
sudo apt install -y uim 

# install imwheel
# https://minjejeon.github.io/learningstock/2016/07/08/change-mouse-wheel-speed-using-imwheel.html
# https://devlog.jwgo.kr/2019/01/31/imwheel-and-what-is-X11/
sudo apt-get install -y imwheel

#========================================

# build-essential
sudo apt-get install -y build-essential
sudo apt-get install -y openjdk-11-jdk

#Docker
sudo apt install -y ap-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt install -y docker-ce
sudo systemctl start docker

#========================================

#----------Utility----------#
#Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update -y
sudo apt-get install -y google-chrome-stable
ls /etc/apt/sources.list.d/google*
sudo rm -rf /etc/apt/sources.list.d/google.list

#Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update -y
sudo apt-get install -y typora

#Slack
sudo snap install -y slack --classic

#KaKaoTalk and Wine
# korean font
sudo apt-get install fonts-nanum

# follow this blog : https://nixytrix.com/error-winehq-stable-depends-wine-stable-5-0-0-bionic/
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key -O /tmp/winehq.key
sudo apt-key add /tmp/winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
wget -nv https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/Release.key -O /tmp/Release.key
sudo apt-key add - < /tmp/Release.key
sudo apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./'
sudo apt-get update
sudo apt install --install-recommends winehq-stable

# reset wine setting 
# windows version : XP -> OK
WINEARCH=win32 winecfg

#install winetricks
sudo apt install winetricks

#install winetricks moodule
winetricks gdiplus_winxp msxml6 riched30 riched20 wmp9 d3dx9_43

#Download kakaoTalk.exe
wget http://app.pc.kakao.com/talk/win32/xp/KakaoTalk_Setup.exe

# 카톡 설치법은 https://lucidmaj7.tistory.com/159 여기를 참고해 주세요.
# kakaotalk install : https://lucidmaj7.tistory.com/159 on bottom side.
wine KaKaoTalk_Setup.exe

# install Extensions for tray.
# 1. restart gnome-shell.
# 2. go to Tweaks/Extension.
# 3. turn on Topicons plus.
# 4. you can see kakao icon on top bar center.
# 5. you can setting anywhere in Topicons plus setting.
sudo apt install gnome-shell-extension-top-icons-plus


#TLP : battery optimization on laptop (If you install ubuntu on laptop NOT Desktop) 
#sudo add-apt-repository ppa:linrunner/tlp # 저장소 추가
#sudo apt install tlp tlp-rdw -y # 패키지 설치
#sudo tlp start # TLP 서비스 시작

#========================================

#intellij-ultimate
sudo snap install -y intellij-idea-ultimate --classic

#vscode
sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update -y
sudo apt-get install -y code

# zsh
sudo apt install zsh -y && chsh -s `which zsh`
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# zsh Theme bullet-train
mkdir zsh_theme && cd zsh_theme

wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme && sudo mkdir $ZSH_CUSTOM/themes && sudo mv bullet-train.zsh-theme $ZSH_CUSTOM/themes/

#zsh-autosuggestion
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions --depth=1

#zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth=1

#zsh-better-npm-completion
git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion --depth=1

#Powerline font
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline%20Italic.ttf
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline%20Bold.ttf
wget https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline%20Bold%20Italic.ttf

cd ..
mv zshrc ~/.zshrc
source ~/.zshrc # attach zsh setting

#========================================

#key mapping

# 오른쪽 Alt키의 기본 키 맵핑을 제거하고 'Hangul'키로 맵핑
xmodmap -e 'remove mod1 = Alt_R'
xmodmap -e 'keycode 108 = Hangul'

# 오른쪽 Ctrl키의 기본 키 맵핑을 제거하고 'Hangul_Hanja'키로 맵핑
xmodmap -e 'remove control = Control_R'
xmodmap -e 'keycode 105 = Hangul_Hanja'

# 키 맵핑 저장
xmodmap -pke > ~/.Xmodmap

#========================================
sudo apt-get update -y
sudo apt-get upgrade -y
                             
