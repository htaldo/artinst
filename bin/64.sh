#!/bin/sh
select="$(find ~/fl/epilepsia -type f | dmenu -i -l 10)"
mupen64plus --resolution 1024x600 --gfx mupen64plus-video-rice "$select"
