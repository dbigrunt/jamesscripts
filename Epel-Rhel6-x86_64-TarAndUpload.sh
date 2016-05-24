#!/bin/bash

#EPEL for Rhel 6 x86_64 tar 

cd /data/epel-x86_64/epel-rhel6/dl.fedoraproject.org/pub

tar -cvf Epel-Rhel6-x86_64.tar epel

mv Epel-Rhel6-x86_64.tar /data/Tarballs/

