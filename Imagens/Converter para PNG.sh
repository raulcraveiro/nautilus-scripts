#!/bin/bash

{

readarray FILENAME <<< "$(echo -e "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" | sed -e 's/\r//g')"

for file in "${FILENAME[@]}"; do
    file=$(echo "$file" | tr -d $'\n')
    convert "$file" "${file%.*}-converted.png"
done

notify-send "Deu certo!" "Os arquivos foram convertidos para PNG." --app-name="Transform" --icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"

}
