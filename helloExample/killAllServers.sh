#!/bin/sh
filename="logs/ServerPIDs.txt"
cat ${filename} | while read line
do
   echo "kill -9 ${line}"
   kill -9 ${line}
done
rm ${filename}
