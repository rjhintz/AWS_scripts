#!/usr/bin/env bash
#
# Ubuntu and Debian
# ========================================
# Updates
echo "sudo apt-get update"
sudo apt-get update
echo "sudo apt-get -y dist-upgrade"
sudo apt-get -y dist-upgrade
echo "sudo apt-get autoremove"
sudo apt-get autoremove
# ========================================
# Set up SSM
#  http://docs.aws.amazon.com/ssm/latest/APIReference/Welcome.html
echo "cd /tmp"
cd /tmp
echo "curl"
curl https://amazon-ssm-us-east-1.s3.amazonaws.com/latest/debian_amd64/amazon-ssm-agent.deb -o amazon-ssm-agent.deb
echo "dpkg -i amazon-ssm-agent.deb"
dpkg -i amazon-ssm-agent.deb
# ========================================
# Metadata
curl http://169.254.169.254/latest/meta-data/
