#!/bin/bash

echo -e "\n"
echo Removing Snapd
echo -e "\n"
sudo apt purge snapd -y
sudo apt-mark hold snapd


echo -e "\n"
echo Installing gnome terminal
echo -e "\n"
sudo apt update && sudo apt install gnome-terminal -y


echo -e "\n"
echo Installing gnome and gdm
echo -e "\n"
sudo apt install gnome-session gdm3 -y