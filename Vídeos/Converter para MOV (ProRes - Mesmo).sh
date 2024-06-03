#!/bin/bash

filename=$@

ffmpeg -i "$@" -vcodec prores_ks -qscale 0 -map 0 -acodec pcm_s16le -ac 1 -ar 22050 "${filename%.*}-converted.mov"

notify-send "Deu certo!" "O arquivo $@ foi convertido para MOV." --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"
