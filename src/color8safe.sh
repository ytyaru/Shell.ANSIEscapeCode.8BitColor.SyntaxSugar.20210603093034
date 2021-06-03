#!/bin/bash
#set -Ceu
#-----------------------------------------------------------------------------
# ANSI Escape Codeにおける文字、背景、下線の色を8bitカラーのうち216色セーフカラーに設定するSGRコードを出力する。
# Created: 2021-05-30T09:27:40+0900
#-----------------------------------------------------------------------------
# echo -e "\e[38;5;Im対象\e[m"
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	SGR=(); PARAMS=(); VALUES=(); COLOR_SPACE_ID=5;
	IsInt() { test 0 -eq $1 > /dev/null 2>&1 || expr $1 + 0 > /dev/null 2>&1; }
	IsRange() { [ "$1" -ge $2 ] && [ "$1" -le $3 ] && return 0 || return 1; }
	Is6() { IsInt "$1" && IsRange "$1" 0 5 && return 0 || return 1; }
	IsRGB() {
		RGB=($(echo "$1" | tr ',' ' '))
		[ 3 -eq ${#RGB[@]} ] || { echo "6bitのRGB値はカンマ区切りの整数値0-5をR,G,Bの順に3つ指定してください。"; exit 1; }
		for v in ${RGB[@]}; do { Is6 $v || { echo '6bitのRGB値はカンマ区切りの整数値0-5をR,G,Bの順に3つ指定してください。'; exit 2; } } done;
	}
	RGB666() { RGB=($(echo "$1" | tr ',' ' ')); echo $((16 + 36 * ${RGB[0]} + 6 * ${RGB[1]} + ${RGB[2]})); }
	SetArray() { SGR+=($1); PARAMS+=("$(IsRGB $2 && RGB666 $2)"); }
	while getopts :f:b:l:F:B:L: OPT; do
	case $OPT in
		f) SetArray 38 $OPTARG;;
		b) SetArray 48 $OPTARG;;
		l) SetArray 58 $OPTARG;;
		x) echo "59"; exit;;
		*) eval "echo \"$(cat "$HERE/help-color8safe.txt")\""
	esac
	done
	shift $((OPTIND - 1))

	[ 1 -le $# ] && SetArray 38 $1;
	[ 2 -le $# ] && SetArray 48 $2;
	[ 3 -le $# ] && SetArray 58 $3;

	for i in `seq 0 $((${#SGR[@]} - 1))`; do { VALUES+=("${SGR[i]};$COLOR_SPACE_ID;${PARAMS[i]}"); } done;
	echo "$(IFS=";"; echo "${VALUES[*]}")"
}
Run "$@"
