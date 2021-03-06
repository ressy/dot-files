#!/usr/bin/env bash

DIR=".dot-files"
cd $(dirname "$0")
DIRPATH=$(pwd -P)

for target in dir_colors vimrc irbrc pythonrc.py vim vimrc screenrc gitconfig
do
	[ -e ~/.$target ] || ln -s $DIR/$target ~/.$target
done

[ -f ~/.xscreensaver ] || cp "$DIRPATH/xscreensaver" ~/.xscreensaver

bash_profile_line="source ~/$DIR/bash_profile.common # Shared settings"
bashrc_line="source ~/$DIR/bashrc.common # Shared settings"
if [[ -e ~/.profile ]]; then
	grep -q -s -F "$bash_profile_line" ~/.profile || echo "$bash_profile_line" >> ~/.profile
fi
grep -q -s -F "$bash_profile_line" ~/.bash_profile || echo "$bash_profile_line" >> ~/.bash_profile
grep -q -s -F "$bashrc_line" ~/.bashrc || echo "$bashrc_line" >> ~/.bashrc
