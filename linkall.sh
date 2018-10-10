#!/bin/bash

# ln -s path/to/file path/to/link
ln -sf $HOME/custom-setup/redshift_config $HOME/.config/redshift.conf && echo "redshift done"
ln -sf $HOME/custom-setup/i3wm.conf $HOME/.i3/config && echo "i3wm done"
ln -sf $HOME/custom-setup/vimrc.main $HOME/.config/nvim/init.vim && echo "nvim done"
ln -sf $HOME/custom-setup/zshrc.main $HOME/.zshrc && echo "zsh done"
ln -sf $HOME/custom-setup/xresources.main $HOME/.Xresources && echo "Xresources done"
ln -sf $HOME/custom-setup/i3blocks.conf $HOME/.i3/i3blocks.conf && echo "i3Blocks done"
