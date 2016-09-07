#!/usr/bin/env bash

DIR=".dot-files"

for target in dir_colors vimrc irbrc pythonrc.py vim vimrc
do
	[ -e ~/.$target ] || ln -s $DIR/$target ~/.$target
done

bashrc_line="source ~/$DIR/bashrc.common # Shared settings"
grep -q -s -F "$bashrc_line" ~/.bashrc || echo "$bashrc_line" >> ~/.bashrc
