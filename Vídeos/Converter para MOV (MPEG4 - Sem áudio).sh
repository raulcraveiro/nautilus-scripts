#!/bin/bash

{

readarray FILENAME <<< "$(echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" | sed -e 's/\r//g')"

for file in "${FILENAME[@]}"; do
    file=$(echo "$file" | tr -d $'\n')
    ffmpeg -i "$file" -codec:v mpeg4 -q:v 0 -an "${file%.*}-converted.mov"
done

notify-send "Deu certo!" "Os áudios foram removidos com sucesso!" --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"

}
