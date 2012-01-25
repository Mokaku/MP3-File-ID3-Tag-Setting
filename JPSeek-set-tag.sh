#!/bin/bash -ex

eyeD3 --to-v2.4 ./*.mp3

eyeD3 --set-encoding=utf8 --remove-images --remove-comments --rename=%A-%t -A "JP Oricin Diciembre" ./*.mp3
eyeD3  --add-image=../../Tools/TMPL/music_cover_201112.jpg:FRONT_COVER:2011-12-COVER-IMG ./*.mp3

touch -d "2011-12-07 10:00" ./*.mp3


