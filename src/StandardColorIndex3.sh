#!/bin/bash
#set -Ceu
#-----------------------------------------------------------------------------
# ASCII EscapeCodeのうち3bitカラーのSGR値を返す。
# Created: 2021-05-30T09:27:40+0900
#-----------------------------------------------------------------------------
case $1 in
	0|k|K|black)   echo '0';;
	1|r|R|red)     echo '1';;
	2|g|G|green)   echo '2';;
	3|y|Y|yellow)  echo '3';;
	4|b|B|blue)    echo '4';;
	5|m|M|magenta) echo '5';;
	6|c|C|cyan)    echo '6';;
	7|w|W|white)   echo '7';;
	*)             { echo 'エラー。色は数値(0-7)か字(k,r,g,y,b,m,c,w)か名前(black,red,green,yellow,blue,magenta,cyan,white)を指定してください。'; exit; };;
esac

