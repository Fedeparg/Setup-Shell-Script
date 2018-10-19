#!/bin/bash -u

version="$(lsb_release -r | cut -f 2)"

#Get updates and upgrade all packages to the last version before install any other software
sudo apt update
sudo apt upgrade -y

#Get Google Chrome Repository 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

#Add Java 10 Repository
sudo add-apt-repository ppa:linuxuprising/java

#Update data of Repositories
if [ $(echo "$version < 18" | bc) -eq 1 ]
then
	sudo apt-get update
fi

#Install all programs
sudo apt-get install google-chrome-stable -y
sudo apt-get install python3-pip -y
sudo snap install telegram-desktop
sudo snap install spotify
sudo snap install sublime-text --classic
sudo snap install eclipse --classic
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install clion --classic
sudo snap install vscode --classic
sudo snap install skype --classic
sudo snap install discord --classic
sudo apt install texlive-full -y
sudo apt install texstudio -y
sudo apt-get install oracle-java11-installer -y
sudo snap install android-studio --classic

#Setup Java enviornment
sudo apt-get install oracle-java11-set-default
sudo cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-11-oracle
JRE_HOME=/usr/lib/jvm/java-11-oracle/jre
EOL

#Cleaning files
sudo apt-get autoclean
sudo apt autoclean
sudo apt autoremove

#Git configuration
git config --global core.editor "vscode -w"
git config --global user.name "Your name here"
git config --global user.email "youremail@mail.com"

#Install zsh
sudo apt install zsh
#Now install "oh-my-zsh" for default configuration
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
