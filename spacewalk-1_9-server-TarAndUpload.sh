#!/bin/bash

#spacewalk-1_9-server-rhel-6 tar 

cd /data/spacewalk/spacewalk-1_9-server-x86_64/spacewalk.redhat.com/yum

tar -cvf spacewalk-1_9-server-x86_64.tar 1.9

mv spacewalk-1_9-server-x86_64.tar /data/Tarballs
