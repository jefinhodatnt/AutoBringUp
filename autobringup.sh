#!/bin/bash
# Autor: Broly
# License: GNU General Public License v3.0
# https://www.gnu.org/licenses/gpl-3.0.txt
	clear
	cat << "EOF"
###################
#    AUTOBRINGUP  # 
###################
EOF

cd device/motorola/ali
read -p "Enter Default oldrom: " oldrom
read -p "now please enter the newrom: " newrom
mv *.dependencies "$newrom".dependencies
mv *_ali.mk "$newrom"_ali.mk
sed -i 's/'$oldrom'/'$newrom'/g' *.*
cd ../../../
cd device/motorola/msm8953-common
mv *.dependencies "$newrom".dependencies
sed -i 's/'$oldrom'/'$newrom'/g' *.*
cd ../../../
source build/envsetup.sh
lunch


