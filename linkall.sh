#!/bin/sh
dir="$(pwd)";
# ln -s path/to/file path/to/link
ln -sf "$dir"/redshift_config "$HOME"/.config/redshift.conf && echo "redshift done"
ln -sf "$dir"/i3/i3wm.conf "$HOME"/.i3/config && echo "i3wm done"
ln -sf "$dir"/i3/blocks.conf "$HOME"/.i3/i3blocks.conf && echo "i3Blocks done"
ln -sf "$dir"/vimrc.main "$HOME"/.config/nvim/init.vim && echo "nvim done"
ln -sf "$dir"/zshrc.main "$HOME"/.zshrc && echo "zsh done"
#ln -sf "$dir"/xresources.main "$HOME"/.Xresources && echo "Xresources done"
ln -sf "$dir"/tmux.conf "$HOME"/.tmux.conf && echo "tmux done"
ln -sr "$dir"/dircolors.nord "$HOME"/.dir_colors && echo "Nord dircolors done"
