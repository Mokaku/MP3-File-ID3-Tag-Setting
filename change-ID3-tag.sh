#!/bin/bash -ex

eyeD3 --to-v2.4 ./*.mp3
eyeD3 --remove-images --remove-comments --set-encoding=utf8 --rename=%A-%t -A "JP Oricin Diciembre" --add-image=../Tools/TMPL/music_cover_201112.jpg: FRONT_COVER: 2011-12-COVER-IMG ./*.mp3
touch -d "2011-12-19 10:00" ./*.mp3
