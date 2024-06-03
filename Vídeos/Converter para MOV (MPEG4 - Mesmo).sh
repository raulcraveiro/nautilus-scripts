#!/bin/bash

filename=$@

ffmpeg -i "$@" -c:v mpeg4 -map 0 -q:v 0 -codec:a pcm_s16le "${filename%.*}-converted.mov"

notify-send "Deu certo!" "O arquivo $@ foi convertido para MOV." --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"
