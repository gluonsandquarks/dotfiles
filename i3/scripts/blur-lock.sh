#!/bin/bash
#TMPBG=/tmp/screen.png
#LOCK=$HOME/lock.png
IMAGE=/tmp/i3lock.png 
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
#ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=5:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -filter_complex "boxblur=5,eq=contrast=1:saturation=0.9" -vframes 1 $IMAGE

#i3lock -i $TMPBG
#rm $TMPBG
#i3lock --insidecolor=ffffff1c --ringcolor=ffffff3e --linecolor=ffffff00 --keyhlcolor=00000080 --ringvercolor=00000000 --insidevercolor=0000001c --ringwrongcolor=00000055 --insidewrongcolor=0000001c -i $IMAGE
i3lock -i $IMAGE
rm -f $IMAGE
