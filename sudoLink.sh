#!/bin/sh
dir="$(pwd)";
# ln -s path/to/file path/to/link
ln -sf "$dir"/surf/surfLauncher.sh /usr/local/bin/s && echo "surf done"
ln -sf "$dir"/dwm/dwm.desktop /usr/share/xsessions/dwm.desktop && echo "DWM login option created"
