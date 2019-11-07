#!/bin/bash

# Copyright 2018 The KubeSphere Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

if [[ `lsb_release -d` =~ '18.04' ]]; then
   
   sudo cp os/sources.list /etc/apt/sources.list

fi


if [[ `lsb_release -d` =~ '18.04' ]]; then
   ps -ef | grep 'apt.systemd.daily' | grep -v grep  >  /dev/null
   if [[ $? -eq 0 ]];then
      notice_apt="Apt program is occupied. Please try again later !"
      echo -e "\033[1;36m$notice_apt\033[0m"
      exit 0
   fi
fi

sudo apt-get update

sudo apt-get install python-minimal libssl-dev sshpass -y

sudo python os/get-pip.py

pip install -U PyYAML

pip install  -r os/requirements.txt

pip install pyopenssl

