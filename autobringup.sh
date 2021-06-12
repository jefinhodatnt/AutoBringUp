#!/bin/bash
# Autor: Broly
# License: GNU General Public License v3.0
# https://www.gnu.org/licenses/gpl-3.0.txt
clear
cat << "EOF"
#####################
#    AUTOBRINGUP    # 
#####################
EOF
printf "\n\n"
printf "WARNING MAKE SURE TO ENTER THE CORRECT ROM NAME\n OR IT WILL RENAME SOME FILES WRONGLY!!!\n\n"
read -p "Please enter the name of the old rom: " oldrom
read -p "Now please enter the name of the new rom: " newrom
printf "\n\n"
if [ -d "device/motorola/ali" ] 
then
	cd device/motorola/ali
	mv *.dependencies "$newrom".dependencies
	mv *_ali.mk "$newrom"_ali.mk
	sed -i 's/'$oldrom'/'$newrom'/g' *.*
	cd ../../../
else
	echo "Error: Directory /path/to/dir does not exists."
fi

if [ -d "device/motorola/msm8953-common" ]
then 
	cd device/motorola/msm8953-common
	mv *.dependencies "$newrom".dependencies
	sed -i 's/'$oldrom'/'$newrom'/g' *.*
	cd ../../../
else
	echo "Error: Directory /path/to/dir does not exists."
fi

source build/envsetup.sh
printf "\n\n"
printf "your bring up is finished, happy building!!\n\n"
exit 1
