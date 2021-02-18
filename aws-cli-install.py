#!/usr/bin/env python3

import os
import fnmatch

#check if system has curl
curl_output = os.system('curl --version')

if curl_output == fnmatch.fnmatch(str(curl_output), 'curl *'):
    print('curl is installed')
else:
    print('curl needs to be installed on this machine')
    # installs curl
    os.system('sudo apt install curl')

#check if system has unzip
unzip_output = os.system('unzip --version')

if unzip_output == fnmatch.fnmatch(str(unzip_output), '* Usage: unzip *'):
    print('unzip is installed')
else:
    print('uunzip needs to be installed on this machine')
    # installs curl
    os.system('sudo apt install unzip')

#install aws cli

os.system('curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"')
os.system('unzip awscliv2.zip')
os.system('sudo ./aws/install')

#check if system has aws cli
aws_output = os.system('aws --version')

if aws_output == fnmatch.fnmatch(str(aws_output), 'aws-cli/*'):
    print('aws cli is installed')
else:
    print('aws cli needs to be installed on this machine')

