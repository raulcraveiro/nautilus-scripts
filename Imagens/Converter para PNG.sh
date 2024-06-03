#!/bin/bash

filename=$@

convert $@ "${filename%.*}".png

notify-send "Deu certo!" "O arquivo $@ foi convertido para PNG." --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"
