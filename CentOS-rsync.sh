#!/bin/sh
mkdir -p /data/CentOS-repos/6/isos/x86_64 /data/CentOS-repos/6/os/x86_64 /data/CentOS-repos/6/updates/x86_64 \
         /data/CentOS-repos/5/isos/x86_64 /data/CentOS-repos/5/os/x86_64 /data/CentOS-repos/5/updates/x86_64
 
rsync="/usr/bin/rsync -aqHz --delete"
mirror=us-msync.centos.org::CentOS

verlist="5 6"
archlist="i386 x86_64"
baselist="os updates isos"
local=/data/CentOS-repos

for ver in $verlist
do
  for arch in $archlist
  do
    for base in $baselist
    do
        remote=$mirror/$ver/$base/$arch/
        $rsync $remote $local/$ver/$base/$arch/
    done
  done
done
