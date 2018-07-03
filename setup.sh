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

#Install all programs above
sudo apt-get install google-chrome-stable -y
sudo apt install texlive -y
sudo apt install texlive-lang-spanish -y
sudo apt install texlive-lang-english -y
sudo apt install texstudio -y
sudo snap install telegram-desktop
sudo snap install spotify
sudo snap install sublime-text --classic
sudo snap install eclipse --classic
sudo snap install pycharm-community --classic
sudo snap install skype --classic
sudo snap install discord --classic
sudo apt-get install oracle-java10-installer -y

#Setup Java enviornment
sudo apt-get install oracle-java10-set-default
sudo cat >> /etc/environment <<EOL
JAVA_HOME=/usr/lib/jvm/java-10-oracle
JRE_HOME=/usr/lib/jvm/java-10-oracle/jre
EOL

#Cleaning files
sudo apt-get autoclean
sudo apt autoclean
sudo apt autoremove