#!/bin/bash

{

readarray FILENAME <<< "$(echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" | sed -e 's/\r//g')"

for file in "${FILENAME[@]}"; do
    file=$(echo "$file" | tr -d $'\n')
    ffmpeg -i "$file" -vcodec prores_ks -qscale 0 -map 0 -acodec pcm_s16le -ac 1 -ar 22050 "${file%.*}-converted.mov"
done

notify-send "Deu certo!" "Os arquivos foram convertidos para MOV com sucesso!" --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"

}
