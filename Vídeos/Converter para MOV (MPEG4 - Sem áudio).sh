#!/bin/bash

filename=$@

ffmpeg -i "$@" -codec:v mpeg4 -q:v 0 -an "${filename%.*}-converted.mov"

notify-send "Deu certo!" "O arquivo $@ foi convertido para MOV." --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"
