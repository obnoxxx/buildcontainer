#!/usr/bin/env bash


sudo dnf upgrade -y
#sudo dnf install -y groupinstall
#sudo dnf5 install 'dnf5-command(groupinstall)'
#sudo dnf -y groupinstall "Development Tools"
sudo dnf install  -y git make cmake texlive-beamer


# orphaned package: use old build as workaround.
sudo dnf install -y  https://kojipkgs.fedoraproject.org//packages/wiki2beamer/0.10.0/9.fc38/noarch/wiki2beamer-0.10.0-9.fc38.noarch.rpm



