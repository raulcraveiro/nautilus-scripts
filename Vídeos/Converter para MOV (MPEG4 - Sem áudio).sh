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
    ffmpeg -i "${file}" -codec:v mpeg4 -q:v 0 -an "${file%.*}-converted.mov" || {
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
