#!/bin/bash
#set -Ceu
#-----------------------------------------------------------------------------
# ASCII EscapeCodeのうち4bitカラーのSGR値を返す。
# Created: 2021-05-30T09:27:40+0900
#-----------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	ColorId="$HERE/StandardColorIndex3.sh"; BRIGHT=0;
	while getopts :b OPT; do
	case $OPT in
		b) BRIGHT=8;;
		*) eval "echo \"$(cat "$HERE/help.txt")\""
	esac
	done
	shift $((OPTIND - 1))
	echo "$(($("$ColorId" "$1") + BRIGHT))"
}
Run "$@"
