# Ubuntu Software Install Script
After Ubuntu 18.04 install, Install packages what I needs.

This is scripts for people who first install Ubuntu. or who don't want to install software by myself.   
This script install almost automatically that those software.

> Those scripts are based on korean user.

### What to do in `installScript.sh`
* Change mirror server to kakao
* Change keyboard rate(on `boot-script.sh` too)
* Change korean keymapping(on `boot-script.sh` too)
* Setting Git global configuration (should add your email and name on `installScript.sh`)
* install Software
  * Developments
    * git (Separate setting is required)
    * curl
    * build-essential
    * openjdk-11-jdk
    * docker-ce
    * zsh & bullet-train-theme & Powerline font(Ubuntu Mono)
  * IDE
    * vscode
    * intellij-idea-ultimate
  * Utility
    * imwheel (Separate setting is required)
    * gnome-tweaks 
    * uim (Separate setting is required)
    * Chrome
    * Typora
    * Slack
    * KakaoTalk & wine (Separate setting is required)
    * fonts-nanum
    * gnome-shell-extension-top-icons-plus (Separate setting is required)

The Settings that `Separate setting is required` is on `intallScript.sh`

### What to do in `boot-script.sh`
