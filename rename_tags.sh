#!/bin/bash -ex

ARTIST="Honey L Days"
ALBUM="chage"
YEAR="2011"
TRACKS="14"
GANR="JPop"
RDATE="2011-11-16"

{
cat <<__EOL__
01.change
02.愛してるが言えなくて
03.願い
04.がんばれ
05.surrender
06.Distance
07.青 ~blue~
08.answer
09.Hello
10.低温ロマンチスト
11.キセキ
12.I can
13.HEART OF GOLD
14.move! (IKKAKUSENKIN ver.)
__EOL__
} | awk -F . '
BEGIN {
print "テキスト内容を表示しますテキスト内容を表示します...."
}

# パターンを省略すると必ずアクションが実行される.
  {
# パターンを省略すると直前にnextで飛ばされていない限り必ず実行される.
# つまり今回は2～5行目で実行される.
	print "#######################"
	print "トラック"$1 "「" $2 "」"
	print "#######################"

	system( "eyeD3 --remove-v2 ./"$1"*.mp3");
	system( "eyeD3 --remove-v1 ./"$1"*.mp3");
	system( "eyeD3 --set-encoding=utf8 -t \""$2"\" -n "$1" ./"$1"*.mp3");

  }

# ここはテキスト全行を読み込み終わった後に実行される.
  END {
# printf も使える.
    printf("全%dのファイルを処理しました.\n", NR)
  }

'

eyeD3  -a "${ARTIST}" -A ${ALBUM} -Y ${YEAR} -N ${TRACKS} -G ${GANR} --remove-comments --set-encoding=utf8 --add-image=./cover.jpg:FRONT_COVER:"Front Cover Image" --set-user-text-frame="Release date":${RDATE} ./*.mp3

eyeD3 --rename=%n\ %t ./*.mp3



#### temporaly
## eyeD3 -t "青い栞" -a "Galileo Galilei" -A "青い栞" -Y 2011 -n 1 -N 3 -G JPop --remove-comments --set-encoding=utf8 --add-image=./cover.jpg:FRONT_COVER:"Front Cover Image" --set-user-text-frame="Release date":2011-06-15 ./01*
