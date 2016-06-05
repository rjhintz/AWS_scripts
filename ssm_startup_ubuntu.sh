#!/usr/bin/env bash
#
# Ubuntu and Debian
#
# ========================================
# Updates
echo "============> Start Updates"
echo "============> sudo apt-get update"
sudo apt-get update
echo "============> sudo apt-get -y dist-upgrade"
sudo apt-get -y dist-upgrade
echo "============> sudo apt-get autoremove"
sudo apt-get autoremove
echo "============> End Updates"
# ========================================
# Set up SSM
#  http://docs.aws.amazon.com/ssm/latest/APIReference/Welcome.html
echo "============> Start SSM Agent Install"
echo "============> cd /tmp"
cd /tmp
echo "============> curl"
curl https://amazon-ssm-us-east-1.s3.amazonaws.com/latest/debian_amd64/amazon-ssm-agent.deb -o amazon-ssm-agent.deb
echo "============> dpkg -i amazon-ssm-agent.deb"
dpkg -i amazon-ssm-agent.deb
echo "============> End SSM Agent Install"
# ========================================
# Metadata
#
echo "============> Start Get Metadata"
curl http://169.254.169.254/latest/meta-data/
#
echo "============> End Startup Procedures from User"
#
echo "============> Start Install Packages"
echo "============> Install Git"
sudo apt-get --assume-yes install git
echo "============> Install python3-pip"
sudo apt-get --assume-yes install python3-pip
echo "============> Install awscli"
sudo apt-get --assume-yes install awscli
echo "============> End Install Packages"
#
# Set up operating environment
#
echo "============> mkdir $HOME/.bin"
mkdir $HOME/.bin
#
echo "============> Clone & symlink dotfiles"
git clone https://github.com/rjhintz/dotfiles.git
# sudo ln -s ~/dotfiles/profile ~/.profile
sudo ln -s ~/dotfiles/gitconfig ~/.gitconfig
sudo ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
sudo ln -s ~/dotfiles/vimrc ~/.vimrc
echo "============> End operating environment set up"
# ##END##
