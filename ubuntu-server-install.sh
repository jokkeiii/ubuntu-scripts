#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "You must enter username as argument."
    return 1 2>/dev/null || exit 1
fi


echo -e "\n"
echo Installing Nala
echo -e "\n"
sudo apt update && sudo apt install curl wget whiptail -y
cd /home/$1/Downloads
wget https://gitlab.com/volian/volian-archive/uploads/b20bd8237a9b20f5a82f461ed0704ad4/volian-archive-keyring_0.1.0_all.deb
wget https://gitlab.com/volian/volian-archive/uploads/d6b3a118de5384a0be2462905f7e4301/volian-archive-nala_0.1.0_all.deb
sudo apt install ./volian-archive*.deb -y
sudo apt update && sudo apt install nala -y
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
cd /home/$1/Downloads
wget --output-document=code.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo nala install ./code.deb -y


echo -e "\n"
echo Installing miscellaneous tools
echo -e "\n"
sudo nala install powertop tlp git -y


echo -e "\n"
echo Tweaks
echo -e "\n"

sudo nala install gnome-shell-extension-manager gnome-tweaks adwaita-icon-theme-full -y

touch /home/$1/.bash_aliases
echo 'alias cls="clear"' | tee /home/$1/.bash_aliases
echo 'alias ll="ls -al"' | tee /home/$1/.bash_aliases
source /home/$1/.bashrc

# gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

git config --global user.name "jokkeiii"
git config --global user.email "joakim.ijas@gmail.com"
git config --global init.defaultBranch main

gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"


echo -e "\n"
echo Cleanup
echo -e "\n"
sudo nala autoremove -y
cd /home/$1/Downloads
rm code.deb
rm volian-archive*.deb