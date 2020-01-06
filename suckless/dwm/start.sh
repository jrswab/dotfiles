#!/bin/sh

"$HOME"/custom-setup/dwm/xrander.sh; # script created with arander

syncthing -no-browser &

#if [ "$(echo "$GDMSESSION" | awk '/dwm/')" = "dwm" ]; then
	"$HOME"/custom-setup/dwm/dwmStatusBar; # start status bar
#fi

