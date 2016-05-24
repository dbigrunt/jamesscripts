#!/bin/bash


###################################################################################
#Wget Scripts Path = /data/james-scripts/wget-scripts                             #
#                                                                                 #
#     wget-centos-5_8-x86_64-os-script                                            #
#     wget-centos-5_8-x86_64-updates-script                                       #
#     wget-centos-6-x86_64-os-script                                              #
#     wget-centos-6-x86_64-updates-script                                         #
#     wget-epel-x86_64-rhel5-script                                               #
#     wget-epel-x86_64-rhel6-script                                               #
#     wget-jpackage-script                                                        #
#     wget-rpmforge-rhel5-x86_64-script                                           #
#     wget-rpmforge-rhel6-x86_64-script                                           #
#     wget-spacewalk-1_7-client-x86_64-rhel-5-script                              #
#     wget-spacewalk-1_7-client-x86_64-rhel-6-script                              #
#     wget-spacewalk-1_7-server-x86_64-script                                     #
###################################################################################



###################################################################################
#  Scripts to Tar up and move Repos to the Tarballs Directory                     #
#                                                                                 #
#     Tar and Move scripts = /data/james-scripts/tar-move                         #
#                                                                                 #
#     CentOS-58-OS-x86_64-TarAndUpload.sh                                         #
#     CentOS-58-updates-TarAndUpload.sh                                           #
#     CentOS-6-x86_64-TarAndUpload.sh                                             #
#     CentOS-6-x86_64-updates-TarAndUpload.sh                                     #
#     Epel-Rhel5-x86_64-TarAndUpload.sh                                           #
#     Epel-Rhel6-x86_64-TarAndUpload.sh                                           #
#                                                                                 #
#   Not All Repositories are Automated because they are hardly ever updated       #
#                                                                                 #
###################################################################################



###################################################################################
####### Scripts to Split up the Tarball into 1GB Chunks                           #
#    Split tarball Script = /data/james-scripts/split-tar-scripts                 #
#                                                                                 #
#     split-cent5-os-tarball                                                      #
#     split-cent5-updates-tarball                                                 #
#     split-cent6-os-tarball                                                      #
#     split-cent6-updates-tarball                                                 #
#     split-epel5-tarball                                                         #
#     split-epel6-tarball                                                         #
#     split-rpmforge-rhel5-x86_64-tarball                                         #
#     split-rpmforge-rhel6-x86_64-tarball                                         #
#                                                                                 #
#    Not All Repositories are Automated because they are hardly ever updated      #
###################################################################################


###################################################################################
#     Script to move the 1GB Chunks to OWT to allow SCN Download                  #
#    Split Push Script = /data/Tarballs/Splits                                    #
#                                                                                 #
#    splits-push-64bit                                                            #
#    splits-push-32bit  (which is rarely used)                                    #
###################################################################################



##################################################################################
# Master Script Builds a list of completed Tarballs then clamscans each tar      #
# if the tarball passes clamscan the file is then added to a list of tars to be  #
# split else the a messges is written to the results file that the file failed   #
# clamscan. The call-splits-scripts is built using the loop then made executable #
# the clean up copy /dev/null into the script after copying the file to          #
# finished-splits-scripts; which is changed to be none executable                #
# The final call the script makes is to push the call the splits-push-64-bit     #
# scirpts which pushes the splits up to the SCN                                  #
#################################################################################

rm -f /home/owt/priv/completed/CentOS*
rm -f /home/owt/priv/completed/Epel*
rm -f /home/owt/priv/completed/rpmforge*
rm -f *clamscan-results*

TarFilesPath=/data/Tarballs
SplitTarballsPath=/data/james-scripts/split-tar-scripts
SplitPushdir=/data/Tarballs/Splits
cd $TarFilesPath

ls -1 *.tar > tarballs-list

for i in $(cat tarballs-list)
   do 
      if clamscan $i > $i-clamscan-results
#       then grep $i /data/james-scripts/split-tar-scripts/* | cut -d: -f 1 >> call-splits-scripts
       then grep $i $SplitTarballsPath/* | cut -d: -f 1 >> call-splits-scripts
       else echo $i' Failed Clamscan' > $i-clamscan-results
      fi
  done

chmod 755 call-splits-scripts
./call-splits-scripts
cp call-splits-scripts finished-splits-scripts
chmod 644 finished-splits-scripts
cp /dev/null > call-splits-scripts
echo '#!/bin/bash' >> call-splits-scripts
cd $SplitPushdir
/data/Tarballs/Splits/splits-push-64bit
