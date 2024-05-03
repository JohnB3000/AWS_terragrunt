#!/bin/bash

sleep 30

sudo yum update -y

sudo yum install unzip -y

sudo yum install pip -y
sudo pip install ansible

cd ~/ && unzip ansible_code.zip

cd ~/ansible

ansible-playbook htop.yml
