#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# ANSI Escape Codeにおける文字、背景、下線の色を8bitカラーで設定するSGRコードを出力する。
# CreatedAt: 2021-06-03
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	COL8="$HERE/color8.sh"
	echo -e "\e[4;$("$COL8" 1 2 4)m対象\e[m"
	echo -e "\e[4;$("$COL8" r g b)m対象\e[m"
	echo -e "\e[4;$("$COL8" red green blue)m対象\e[m"
	echo -e "\e[4;$("$COL8" -f red -b green -l blue)m対象\e[m"
	echo -e "\e[4;$("$COL8" -F red -B green -L blue)m対象\e[m"
	echo -e "\e[4;$("$COL8" -f 160 -b 118 -l 33)m対象\e[m"
	echo -e "\e[4;$("$COL8" -F 160 -B 118 -L 33)m対象\e[m"
	echo -e "\e[4;$("$COL8" 160 118 33)m対象\e[m"
	echo -e "\e[4;$("$COL8" red)m対象\e[m"
	echo -e "\e[4;$("$COL8" red green)m対象\e[m"
	cd "$HERE"
}
Run "$@"
