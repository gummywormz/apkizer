#!/usr/bin/env bash

#This script takes an apk file and converts it to a Chrome / ARChon compatible format.
#$1 - Input file (must be an apk)
#$2 - Output directory. It must already exist. 
#NOTE: aapt must be put in your path for this to work. It is recommended to copy this into the same folder as apkizer / your bin folder
#Because android studio removes outdated build-tools directories

set -e

echo "APKizer v1.0"
echo "gummywormz.github.io"

if [[ -z "$1" || -z "$2" ]]; 
	then
		echo "Usage: /path/to/apk.apk /full/output/directory"
		exit 1
fi

if [[ ! -f "$1" || ! "$1" == *".apk" ]];
	then
		echo "APK file does not exist or is invalid"
		exit 1
fi

if [ ! -d "$2" ];
	then
		echo "Directory doesn't exist"
		exit 1
fi

isAapt=$(which aapt)

if [ -z "$isAapt" ];
	then
		echo "aapt is not in your path!"
		exit 1
fi

if [ ! -d "$2/ARChon" ]; 
	then
		#make directories
		echo "No ARChon Directory established! Creating..."
		mkdir -p "$2/ARChon/_locales/en"
		mkdir -p "$2/ARChon/vendor/chromium/crx" 

		#copy files
		workDir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
		yes | cp "$workDir/res/messages.json" "$2/ARChon/_locales/en"
		yes | cp "$workDir/res/"{app_main.html,icon.png,manifest.json} "$2/ARChon"

		#replace stuff in manifest

		apkname=$("basename" "$1")
		#pkgname=$("aapt dump badging $1 | grep package:\ name")
		#Thanks to theellipses for this:
		#pkgname=$("aapt dump badging $apk | grep package | awk '{print $1}' | sed s/name=/g | sed s/\'/g")
		pkgname=`aapt dump badging $1 | grep package | awk '{print $2}' | sed s/name=//g | sed s/\'//g`

		sed -i '.bak' -e "s/__apkname__/$apkname/g" -e "s/__PACKAGE__/$pkgname/g" "$2/ARChon/manifest.json"

fi

echo "Copying APK..."

yes | cp "$1" "$2/ARChon/vendor/chromium/crx"

echo "Success!"

exit 0
