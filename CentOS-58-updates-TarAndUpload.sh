#!/bin/bash

#Centos 5.8 updates tar 

cd /data/CentOS-5_8-x86_64/updates/mirror*/pub/centos/5

tar -cvf CentOS-5_8-x86_64-updates.tar updates

mv CentOS-5_8-x86_64-updates.tar /data/Tarballs/

