#!/bin/bash

#For RPMForge Rhel6

cd /data/rpmforge-rhel6-x86_64/updates/
rm -f *.rpm
cd /data/rpmforge-rhel6-x86_64/
rm -f updates-list

cd /data/RPMFORGE-repos/el6/x86_64/dag/RPMS

find . -mtime -7 ! -name '*.html' | grep  .rpm | cut -b 1-2 --complement >> /data/rpmforge-rhel6-x86_64/updates-list

   echo '===================================' >> /data/Scanned-Rpms-report
   echo ' RPMForge rhel 6 X86_64 UPDATES' >> /data/Scanned-Rpms-report
   echo '===================================' >> /data/Scanned-Rpms-report

for i in $(cat /data/rpmforge-rhel6-x86_64/updates-list)
     do
        if clamscan $i
        then cp $i /data/rpmforge-rhel6-x86_64/updates/
         echo '===================================' >> /data/Scanned-Rpms-report
          echo $i '  has been uploaded' >> /data/Scanned-Rpms-report
          echo '===================================' >> /data/Scanned-Rpms-report
        else
        echo '===================================' >> /data/Scanned-Rpms-report
        echo $i ' Failed virus scan' >> /data/Scanned-Rpms-report
        echo '===================================' >> /data/Scanned-Rpms-report
        fi
    done
       if ls /data/rpmforge-rhel6-x86_64/updates/ | grep rpm
       then
           cd /data/
           tar -cvf rpmforge-rhel6-x86_64.tar rpmforge-rhel6-x86_64
           chown owtuser1:owtuser1 rpmforge-rhel6-x86_64.tar
           mv rpmforge-rhel6-x86_64.tar /home/owt/priv/pickup
      fi
