#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Create feature: $0 <feature_name>"
    exit 1
fi

feature_name="$1"
features_path="./features"

mkdir -p "$features_path"

cd "$features_path" || exit 1

flutter create --template=package "$feature_name"

if [ $? -eq 0 ]; then
    echo "\n\nPackage '$feature_name' created successfully in $features_path."

    cd "$feature_name" || exit 1

    mkdir -p "lib/src" "lib/src/data" "lib/src/domain" "lib/src/presentation"

    touch "lib/src/${feature_name}_feature.dart"

    touch "lib/src/presentation/${feature_name}_screen.dart"

    echo "Folder and file structure successfully created in lib/src."
else
    echo "Error creating the package '$service_name'. Check that Flutter is installed and that the feature name is valid."
fi