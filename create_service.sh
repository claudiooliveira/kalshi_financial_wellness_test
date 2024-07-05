#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Create service: $0 <service_name>"
    exit 1
fi

service_name="$1"
services_path="./services"

mkdir -p "$services_path"

cd "$services_path" || exit 1

flutter create --template=package "$service_name"

if [ $? -eq 0 ]; then
    echo "\n\nPackage '$service_name' successfully created in $services_path."

    cd "$service_name" || exit 1

    mkdir -p "lib/src"

    touch "lib/src/${service_name}_service.dart"

    echo "Folder and file structure successfully created in lib/src."
else
    echo "Error creating the package '$service_name'. Check that Flutter is installed and that the service name is valid."
fi