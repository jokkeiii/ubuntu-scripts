#!/bin/bash

wget -P ~/Downloads https://gitlab.com/volian/volian-archive/uploads/d00e44faaf2cc8aad526ca520165a0af/volian-archive-nala_0.2.0_all.deb

wget -P ~/Downloads https://gitlab.com/volian/volian-archive/uploads/d9473098bc12525687dc9aca43d50159/volian-archive-keyring_0.2.0_all.deb

sudo apt install ~/Downloads/volian-archive*.deb -y

sudo apt update

sudo apt install nala -y