#!/bin/bash

#Centos 6.2 updates tar 

cd /data/CentOS-6-x86_64/updates/mirror*/pub/centos/6

tar -cvf CentOS-6-x86_64-updates.tar updates

mv CentOS-6-x86_64-updates.tar /data/Tarballs/

