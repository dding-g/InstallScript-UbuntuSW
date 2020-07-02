#!/bin/bash

# mirror server change
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
#========================================

#keyboard input rate
xset r rate 180

sudo apt update -y
sudo apt install vim git curl gnome-tweaks
sudo apt upgrade -y
sudo apt autoremove -y
git config --global user.email "area409@gmail.com"
git config --global user.name "ddingg"

#========================================

# build-essential
sudo apt-get install build-essential
sudo apt-get install openjdk-11-jdk

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
sudo dpkg -i ./google-chrome-stable_current_amd64.deb

#Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update -y
sudo apt-get install typora

#Slack
sudo snap install slack --classic

#TLP : battery optimization on laptop (If you install ubuntu on laptop NOT Desktop) 
#sudo add-apt-repository ppa:linrunner/tlp # 저장소 추가
#sudo apt install tlp tlp-rdw -y # 패키지 설치
#sudo tlp start # TLP 서비스 시작

#========================================

#intellij-ultimate
sudo snap install intellij-idea-ultimate --classic

#vscode
sudo sh -c 'curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg'
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code

# zsh
sudo apt install zsh -y && chsh -s `which zsh`
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# zsh Theme bullet-train
mkdir zhs_theme && cd zhs_theme

wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme && mkdir $ZSH_CUSTOM/themes && mv bullet-train.zsh-theme $ZSH_CUSTOM/themes/

#zsh-autosuggestion
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions --depth=1

#zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --depth=1

#zsh-better-npm-completion
git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion --depth=1

mv ./zshrc ~/.zshrc
source ~/.zshrc
