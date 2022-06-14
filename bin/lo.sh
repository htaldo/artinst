#!/bin/sh

cd ~/.local/bin/res/lo
layout="$(echo -e "$(ls)" | dmenu -p "select a layout:")"
~/.local/bin/res/lo/$layout
