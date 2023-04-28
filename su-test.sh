#!/bin/bash

echo -e "\n"
echo Installing Nala
echo -e "\n"
sudo apt update && sudo apt install curl git wget powertop -y
cd /home/$1/Downloads/
wget https://gitlab.com/volian/volian-archive/uploads/b20bd8237a9b20f5a82f461ed0704ad4/volian-archive-keyring_0.1.0_all.deb
wget https://gitlab.com/volian/volian-archive/uploads/d6b3a118de5384a0be2462905f7e4301/volian-archive-nala_0.1.0_all.deb
sudo apt update && sudo apt install ./volian-archive*.deb -y
echo "deb-src https://deb.volian.org/volian/ scar main" | sudo tee -a /etc/apt/sources.list.d/volian-archive-scar-unstable.list

echo -e "\n"
echo Installing Brave
echo -e "\n"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala install --update brave-browser -y

echo -e "\n"
echo Installing VS Code
echo -e "\n"
wget --output-document=code.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo nala install ./code.deb -y

echo -e "\n"
echo Removing Firefox as snap and installing it from ppa
echo -e "\n"
sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo nala install --update firefox -y

echo -e "\n"
echo Installing spotify
echo -e "\n"
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo nala install --update spotify-client -y
echo -e "\n"
echo DONE
echo -e "\n"