#!/bin/sh
mkdir -p /data/REMI-repo/enterprise/x86_64/
       
 
rsync="/usr/bin/rsync -aqHz --delete"
#mirror=mirror.awanti.com::remi
mirror=91.190.113.114::remi

verlist="enterprise"
os="6"
archlist="x86_64"
repository="remi"

#baselist="os updates isos"
local=/data/REMI-repo

for ver in $verlist
do
  for arch in $archlist
  do
#    for base in $baselist
#    do
        remote=$mirror/$ver/$os/$repository/$arch/
         echo $remote
        $rsync $remote $local/$ver/$arch/
    done
  done
#done
