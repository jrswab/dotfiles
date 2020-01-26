#!/bin/sh
dir="$(pwd)";
# ln -s path/to/source_file path/to/desired_link
ln -sf "$dir"/redshift_config "$HOME"/.config/redshift.conf && echo "redshift done"
#ln -sf "$dir"/i3/i3wm.conf "$HOME"/.i3/config && echo "i3wm done"
#ln -sf "$dir"/i3/blocks.conf "$HOME"/.i3/i3blocks.conf && echo "i3Blocks done"
ln -sf "$dir"/vimrc.main "$HOME"/.config/nvim/init.vim && echo "nvim done"
ln -sf "$dir"/zshrc.main "$HOME"/.zshrc && echo "zsh done"
ln -sf "$dir"/tmux.conf "$HOME"/.tmux.conf && echo "tmux done"
ln -sf "$dir"/dirColors/dircolors.nord "$HOME"/.dir_colors && echo "Nord dircolors done"
ln -sf "$dir"/bspwm/bspwmrc "$HOME"/.config/bspwm/bspwmrc && echo "bspwmrc done"
ln -sf "$dir"/polybar/polybarConfig "$HOME"/.config/polybar/config && echo "Polybar config done"
ln -sf "$dir"/polybar/launchPoly.sh "$HOME"/.config/polybar/launch.sh && echo "Polybar launch done"
ln -sf "$dir"/sxhkdrc "$HOME"/.config/sxhkd/sxhkdrc && echo "sxhkdrc done"
