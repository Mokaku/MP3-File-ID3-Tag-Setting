#!/bin/bash -e


eyeD3 --to-v2.4 ./*.mp3

ls *.mp3 | while read line
do

mnum=`echo $line | cut -d" " -f1`
artist=`echo $line | cut -d" " -f2- | awk -F " - " '{print $1}'`
title=`echo $line | cut -d" " -f2- | awk -F " - " '{print $2}'|sed -e "s/.mp3$//g"`
echo "$mnum|$artist|$title"
eyeD3 --remove-images --remove-comments --set-encoding=utf8 -a "$artist" -t "$title" -A "JP Oricin Diciembre" -Y 2011 --add-image=../Tools/TMPL/music_cover_201112.jpg:FRONT_COVER:2011-12-COVER-IMG ./$mnum*.mp3
eyeD3 --rename=%A-%t ./$mnum*.mp3
echo "==========="
done
touch -d "2011-12-19 10:00" ./*.mp3

## eyeD3 --to-v2.4 ./*.mp3
## eyeD3 --remove-images --remove-comments --set-encoding=utf8 --rename=%A-%t -A "JP Oricin Diciembre" --add-image=../Tools/TMPL/music_cover_201112.jpg: FRONT_COVER: 2011-12-COVER-IMG ./*.mp3
## touch -d "2011-12-19 10:00" ./*.mp3
