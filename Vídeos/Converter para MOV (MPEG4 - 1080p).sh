#!/bin/bash

{

readarray FILENAME <<< "$(echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" | sed -e 's/\r//g')"

for file in "${FILENAME[@]}"; do
    file=$(echo "$file" | tr -d $'\n')
    ffmpeg -i "$file" -c:v mpeg4 -map 0 -q:v 0 -codec:a pcm_s16le -vf scale=w=1920:h=1080 "${file%.*}-converted.mov"
done

notify-send "Deu certo!" "Os arquivos foram convertidos para MOV com sucesso!" --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"

}
