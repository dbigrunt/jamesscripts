#!/bin/sh
mkdir -p /data/RPMFORGE-repos/el6/x86_64 \
         /data/RPMFORGE-repos/el5/x86_64
 
rsync="/usr/bin/rsync -aqHz --delete"
mirror=mirror.us.leaseweb.net::dag

os="redhat"
verlist="el5 el6"
language="en"
archlist="x86_64"
repository="dag"
#baselist="os updates isos"
local=/data/RPMFORGE-repos

for ver in $verlist
do
  for arch in $archlist
  do
#    for base in $baselist
#    do
        remote=$mirror/$os/$ver/$language/$arch/$repository
         echo $remote
        $rsync $remote $local/$ver/$arch/
    done
  done
#done
