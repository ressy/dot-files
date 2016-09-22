#!/usr/bin/env bash

DIR=".dot-files"
DIRPATH=$(readlink -f "$(dirname "$0")")

for target in dir_colors vimrc irbrc pythonrc.py vim vimrc
do
	[ -e ~/.$target ] || ln -s $DIR/$target ~/.$target
done

[ -f ~/.xscreensaver ] || cp "$DIRPATH/xscreensaver" ~/.xscreensaver

bashrc_line="source ~/$DIR/bashrc.common # Shared settings"
grep -q -s -F "$bashrc_line" ~/.bashrc || echo "$bashrc_line" >> ~/.bashrc
