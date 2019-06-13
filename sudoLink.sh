#!/bin/sh
dir="$(pwd)";
# ln -s path/to/file path/to/link
ln -sf "$dir"/surfLauncher.sh /usr/local/bin/s && echo "surf done"
