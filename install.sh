#!/usr/bin/env bash

#Adds the directory this script is in to your PATH
set -e
touch ~/.bash_profile
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cmd="export PATH=\"$DIR:$PATH\""
echo "$cmd" >> ~/.bash_profile
source ~/.bash_profile
chmod +x "$DIR/apkizer.sh"
if [[ -f "$DIR/aapt" ]];
    then
        chmod +x "$DIR/aapt"
fi
echo "Install Successful."
