#!/bin/bash

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -ne 1 ]; then
    echo "Criar feature: $0 <feature_name>"
    exit 1
fi

feature_name="$1"
features_path="./features"

mkdir -p "$features_path"

cd "$features_path" || exit 1

flutter create --template=package "$feature_name"

if [ $? -eq 0 ]; then
    echo "\n\nPacote '$feature_name' criado com sucesso em $features_path."

    # Navega para a pasta do pacote criado
    cd "$feature_name" || exit 1

    # Cria as pastas necessárias
    mkdir -p "lib/src" "lib/src/data" "lib/src/domain" "lib/src/presentation"

    # Cria o arquivo feature_name_feature.dart
    touch "lib/src/${feature_name}_feature.dart"

    touch "lib/src/presentation/${feature_name}_screen.dart"

    echo "Estrutura de pastas e arquivo criados com sucesso em lib/src."
else
    echo "Erro ao criar o pacote '$feature_name'. Verifique se o Flutter está instalado e se o nome da feature é válido."
fi