#!/bin/bash

# mirror server change
sudo sed -i 's/kr.archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list
#========================================

sudo apt update -y
sudo apt install -y vim git curl gnome-tweaks
sudo apt upgrade -y
sudo apt autoremove -y
git config --global user.email "area409@gmail.com"
git config --global user.name "ddingg"

#keyboard input rate
xset r rate 180

# uim & byeoru, for korean
sudo apt install -y uim uim-byeoru

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
source ~/.zshrc

sudo apt-get update -y
sudo apt-get upgrade -y
                             
