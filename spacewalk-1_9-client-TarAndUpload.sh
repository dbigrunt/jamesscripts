#!/bin/bash

#spacewalk-1_9-client-rhel-5 & 6 tar 

cd /data/spacewalk/spacewalk-1_9-client-rhel-5-x86_64/spacewalk.redhat.com/yum

tar -cvf spacewalk-1_9-client-rhel-5-x86_64.tar 1.9-client

mv spacewalk-1_9-client-rhel-5-x86_64.tar /data/Tarballs/

cd /data/spacewalk/spacewalk-1_9-client-rhel-6-x86_64/spacewalk.redhat.com/yum

tar -cvf spacewalk-1_9-client-rhel-6-x86_64.tar 1.9-client

mv spacewalk-1_9-client-rhel-6-x86_64.tar /data/Tarballs/
