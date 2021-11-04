#!/usr/bin/env python3

import os
import subprocess

os.system('sudo apt-get update')
os.system('sudo apt-get upgrade')
os.system('sudo apt-get dist-upgrade')

#check if system has curl the

curl_command = subprocess.run('curl --version',  stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

if curl_command.returncode == 0:
    print('curl is installed\n')
else:
    print('curl needs to be installed on this machine\n')
    # installs curl
    os.system('sudo apt install curl')

# check if system has unzip
unzip_command = subprocess.run('unzip --help',  stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

if unzip_command.returncode == 0:
    print('unzip is installed\n')
else:
    print('unzip needs to be installed on this machine\n')
    # installs curl
    os.system('sudo apt install unzip')

# # #install aws cli

aws_output = subprocess.run('aws --version',  stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

if aws_output.returncode == 0:
    print('aws cli is installed\n')
else:
    print('aws cli needs to be installed on this machine\n')
    # installs aws cli
    os.system('curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"')
    os.system('unzip awscliv2.zip')
    os.system('sudo ./aws/install')
    #check if system has aws cli
    aws_output = os.system('aws --version')
    print(aws_output)


