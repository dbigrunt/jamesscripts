#!/bin/sh
mkdir -p /data/EPEL-repos/6/x86_64 \
         /data/EPEL-repos/5/x86_64
 
rsync="/usr/bin/rsync -aqHz --delete"
mirror=mirror.us.leaseweb.net::epel

verlist="5 6"
archlist="x86_64"
local=/data/EPEL-repos

for ver in $verlist
do
  for arch in $archlist
  do
        remote=$mirror/$ver/$base/$arch/
        $rsync $remote $local/$ver/$arch/
    done
  done
