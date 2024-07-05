#!/bin/bash

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -ne 1 ]; then
    echo "Criar serviço: $0 <service_name>"
    exit 1
fi

service_name="$1"
services_path="./services"

mkdir -p "$services_path"

cd "$services_path" || exit 1

flutter create --template=package "$service_name"

if [ $? -eq 0 ]; then
    echo "\n\nPacote '$service_name' criado com sucesso em $services_path."

    # Navega para a pasta do pacote criado
    cd "$service_name" || exit 1

    # Cria as pastas necessárias
    mkdir -p "lib/src"

    # Cria o arquivo service_name_service.dart
    touch "lib/src/${service_name}_service.dart"

    echo "Estrutura de pastas e arquivo criados com sucesso em lib/src."
else
    echo "Erro ao criar o pacote '$service_name'. Verifique se o Flutter está instalado e se o nome do serviço é válido."
fi