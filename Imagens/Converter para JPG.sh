#!/bin/bash

filename=$@

convert $@ "${filename%.*}".jpg

notify-send "Deu certo!" "O arquivo $@ foi convertido para JPG." --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"
