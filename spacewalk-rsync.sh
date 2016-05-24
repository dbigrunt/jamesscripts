#!/bin/sh
mkdir -p /data/Spacewalk-Repos
        
 
rsync="/usr/bin/rsync -aqHz --delete"
mirror=spacewalk.redhat.com::yum
#mirror=yum.spacewalkproject.org::

release="latest latest-client"
osversion="RHEL"
baselist="5 6"
archlist="x86_64"
local=/data/Spacewalk-Repos

for rel in $release
do
  for os in $osversion
    do
    for base in $baselist 
      do        
     for arch in $archlist
      do
        remote=$mirror/$rel/$os/$base/$arch/
        $rsync $remote $local/$rel/$os/$base/$arch/
    done
   done
  done
done
