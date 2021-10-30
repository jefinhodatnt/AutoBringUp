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
read -r -p "Please enter the name of the old rom: " oldrom
read -r -p "Now please enter the name of the new rom: " newrom
printf "\n\n"

if [[ -d "device/xiaomi/tulip" ]]; then
    cd device/xiaomi/tulip || exit
else
    printf "path to device doesn't exist!!\n"
    exit 1
fi

if [[ -f "$oldrom.dependencies" ]]; then
    mv "$oldrom".dependencies "$newrom".dependencies || :
else 
    printf "There's no file .dependencies in /device/xiaomi/tulip ignoring\n!!"
fi

if [[ -f "$oldrom"_tulip.mk ]]; then
    mv "$oldrom"_tulip.mk "$newrom"_tulip.mk
    sed -i 's/'"$oldrom"'/'"$newrom"'/g' ./*.*
    cd ../../../
else
    printf "file not found please make sure your device tree is correct!\n"
    exit 1
fi

printf "\n\n"
printf "your bring up is finished\n to start type\nsource build/envsetup.sh\n and lunch \n"
exit 1
