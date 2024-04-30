#!/bin/bash

wget --output-document=code.deb -P ~/Downloads "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo apt install ~/Downloads/code.deb -y