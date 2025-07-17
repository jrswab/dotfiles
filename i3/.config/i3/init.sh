#!/bin/sh

# Define cleanup function
cleanup() {
    echo "Script terminating, restoring default settings..."
    exit 0
}

# Trap signals
trap cleanup INT TERM

while true; do
	DPFOUND=$(xrandr | grep '^DP-1 Connected')
	if [ -n "$DPFOUND" ]; then
		# Turn off internal monitor and enable 4k monitor
		xrandr --output eDP-1 --off && \
		xrandr --output DP-1 --primary --mode 2560x1440 --pos 2560x0 --rotate normal
		# Full 4k Resolution
		#xrandr --output DP-1 --primary --mode 3840x2160 --pos 3840x0 --rotate normal
	else
		# Internal monitor only:
		xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal
	fi

	ZSAVOY=$(lsusb | grep 'ZSA Technology Labs Voyager')
	if [ -n "$ZSAVOY" ]; then
		# Force US keyborad layout for ZSA Voyager:
		LAYOUT=${1:-"us"}
		VARIANT=${2:-""}
		setxkbmap "$LAYOUT" "$VARIANT";
	else
		# Programmer Dvorak for built in keyboard:
		LAYOUT=${1:-"us"}
		VARIANT=${2:-"dvp"}
		setxkbmap "$LAYOUT" "$VARIANT";

		# Enable "middle"/"two finger" click with the trackpad:
		xinput set-prop "ELAN0412:00 04F3:311D Touchpad" "libinput Click Method Enabled" 0 1
	fi

	sleep 5
done

