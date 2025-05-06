#!/bin/sh

4kFound=$(xrandr | grep '^DP-1 Connected')

# -n asks if the string in the variable has a non-zero legnth.
# use -z to check in the varibale has a length of zero.
if [ -n "$4kFound" ] ; then
	# xrandr command here for single 4k monitor
	xrandr --output eDP-1 --off && \
	xrandr --output DP-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal
	#xrandr --output DP-1 --primary --mode 3840x2160 --pos 3840x0 --rotate normal

fi

# Force US keyborad layout for ZSA Voyager:
LAYOUT=${1:-"us"}
VARIANT=${2:-""}
setxkbmap "$LAYOUT" "$VARIANT";

exit 0;

