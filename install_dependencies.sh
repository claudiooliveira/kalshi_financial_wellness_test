#!/bin/bash

execute_flutter_pub_get() {
    local path="$1"
    local pubspec_file="${path}/pubspec.yaml"

    if [ -f "$pubspec_file" ]; then
        echo "Executing 'flutter pub get' in ${path}"
        (cd "${path}" && flutter pub get)
    else
        echo "Fila 'pubspec.yaml' not found in ${path}, searching in subfolders..."
        for dir in "${path}"/*/; do
            if [ -d "$dir" ]; then
                execute_flutter_pub_get "$dir"
            fi
        done
    fi
}

cd "$(dirname "$0")"

execute_flutter_pub_get "$(pwd)"