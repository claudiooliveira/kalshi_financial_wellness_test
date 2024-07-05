#!/bin/bash

execute_flutter_pub_get() {
    local path="$1"
    local pubspec_file="${path}/pubspec.yaml"

    if [ -f "$pubspec_file" ]; then
        echo "Executando 'flutter pub get' em ${path}"
        (cd "${path}" && flutter pub get)
    else
        echo "Arquivo 'pubspec.yaml' não encontrado em ${path}, procurando nas subpastas..."
        for dir in "${path}"/*/; do
            if [ -d "$dir" ]; then
                execute_flutter_pub_get "$dir"
            fi
        done
    fi
}

# Navegue até o diretório onde este script está localizado
cd "$(dirname "$0")"

# Execute a função no diretório atual
execute_flutter_pub_get "$(pwd)"