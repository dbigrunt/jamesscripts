#!/bin/bash

rm -f /data/Scanned-Rpms-report

cd /data/epel-x86_64

bash -xv gather-epel5-updates.sh

bash -xv gather-epel6-updates.sh

cd /data/CentOS-5_8-x86_64

bash -xv centos5-x86_64-updates.sh

bash -xv centos5-x86_64-os.sh

cd /data/CentOS-6-x86_64

bash -xv centos6-x86_64-updates.sh

bash -xv centos6-x86_64-os.sh

cd /data/rpmforge-rhel6-x86_64

bash -xv Gather-RPMforge-rhel6.sh

cd /data/rpmforge-rhel5-x86_64

bash -xv Gather-RPMforge-rhel5.sh

cp /data/Scanned-Rpms-report /home/owt/priv/pickup/

cp /data/Tarballs/clamscan-remi-x86_64-results /home/owt/priv/pickup/
