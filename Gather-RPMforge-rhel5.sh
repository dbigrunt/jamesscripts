#!/bin/bash

#For RPMForge Rhel5

rm -f /data/rpmforge-rhel5-x86_64/updates/*.rpm
rm -f /data/rpmforge-rhel5-x86_64/updates-list

cd /data/RPMFORGE-repos/el5/x86_64/dag/RPMS

find . -mtime -7 ! -name '*.html' | grep  .rpm | cut -b 1-2 --complement >> /data/rpmforge-rhel5-x86_64/updates-list

   echo '===================================' >> /data/Scanned-Rpms-report
   echo ' RPMForge rhel 6 X86_64 UPDATES' >> /data/Scanned-Rpms-report
   echo '===================================' >> /data/Scanned-Rpms-report

for i in $(cat /data/rpmforge-rhel5-x86_64/updates-list)
     do
        if clamscan $i
        then cp $i /data/rpmforge-rhel5-x86_64/updates/
         echo '===================================' >> /data/Scanned-Rpms-report
          echo $i '  has been uploaded' >> /data/Scanned-Rpms-report
          echo '===================================' >> /data/Scanned-Rpms-report
        else
        echo '===================================' >> /data/Scanned-Rpms-report
        echo $i ' Failed virus scan' >> /data/Scanned-Rpms-report
        echo '===================================' >> /data/Scanned-Rpms-report
        fi
    done
       if ls /data/rpmforge-rhel5-x86_64/updates/ | grep rpm
       then
           cd /data/
           tar -cvf rpmforge-rhel5-x86_64.tar rpmforge-rhel5-x86_64
           chown owtuser1:owtuser1 rpmforge-rhel5-x86_64.tar
           mv rpmforge-rhel5-x86_64.tar /home/owt/priv/pickup
      fi
