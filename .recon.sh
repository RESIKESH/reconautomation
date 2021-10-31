##!/bin/bash
day=$(date +%A)
dom=$1
echo "welcome The quieter you become, the more you are able to hear...  $USER! Today is $day"
if [ -z "$1" ]
then
        echo "Usage: ./recon.sh <IP>"
        exit 1
fi
sublist3r -d $1 -v -o domains.txt
~/go/bin/assetfinder --subs-only $1 | tee -a domains.txt
sort -u domains.txt -o domains.txt
echo "\n\n[+] Checking for alive domains..\n"
cat domains.txt | ~/go/bin/httprobe | tee -a alive.txt
cat alive.txt
cat domains.txt
