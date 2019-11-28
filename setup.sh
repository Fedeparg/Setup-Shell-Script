#!/bin/bash -u

#Get updates and upgrade all packages to the last version before install any other software
sudo apt update
sudo apt upgrade -y

#Get Google Chrome Repository 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#Install all programs
sudo apt install google-chrome-stable -y
sudo apt install python3-pip -y
sudo snap install telegram-desktop
sudo snap install spotify
sudo snap install sublime-text --classic
sudo snap install code --classic
sudo apt install texlive -y
sudo apt install texlive-lang-spanish -y
sudo apt install texstudio -y
sudo apt install default-jdk

#Cleaning files
sudo apt-get autoclean
sudo apt autoclean
sudo apt autoremove

#Git configuration
git config --global core.editor "code -w"
git config --global user.name "Your name"
git config --global user.email "Youremail@mail.com"

#Install zsh
sudo apt install zsh -y
#Now install "oh-my-zsh" for default configuration
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)
