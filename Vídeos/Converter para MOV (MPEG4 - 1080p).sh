#!/env/bin/env bash

{

icon="/home/raulcraveiro/.local/share/icons/custom/transform-symbolic.svg"

readarray FILENAME <<< "$(echo -e "${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS}" | sed -e 's/\r//g')"

errors=false
failed_files=""
directory=""

for file in "${FILENAME[@]}"; do
    directory=$(dirname "${directory}")
    file=$(echo "${file}" | tr -d $'\n')
    ffmpeg -i "${file}" -c:v mpeg4 -map 0 -q:v 0 -codec:a pcm_s16le -vf scale=w=1920:h=1080 "${file%.*}-converted.mov" || {
        errors=true;
        if [ "${failed_files}" = "" ] ; then
            failed_files=" ${file}";
        else
            failed_files="${failed_files}"$'\n'" ${file}";
        fi
    }
done

[ "${errors}" == "true" ] && {
    echo "${failed_files}" > "${directory}/log.txt"
    notify-send "Ocorreram alguns erros"                                                                  \
                'Alguns arquivos não puderam ser convertidos veja o arquivo log.txt para obter uma lista' \
                --app-name="Transform" --icon="${icon}"
    exit 
}

notify-send 'Deu certo!'                                          \
            'Os arquivos foram convertidos para MOV com sucesso!' \
            --app-name="Transform" --icon="${icon}"

}
