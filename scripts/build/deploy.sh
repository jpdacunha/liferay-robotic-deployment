#!/bin/bash

echo " Deploying Liferay workspace plugins ..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

destination=$PROJECT_ROOT/runtime/liferay/deploy

widget_home=$PROJECT_ROOT/liferay-workspace/build

copy_artifact() {
    local source_file="$1"
    echo "Copying $source_file to $destination"
    cp -f "$source_file" "$destination"
}

is_delayed_artifact() {
    local source_file="$1"
    local file_name
    file_name="$(basename "$source_file")"

    [[ "$file_name" == liferay-*site-initializer*.zip ||
       "$file_name" == liferay-*site-initializer*.jar ]]
}

delayed_artifacts=()

IFS=$'\n'
for i in $(find $widget_home/* -name 'liferay-*.zip' -not -path '*node_modules*'  );
do
    if is_delayed_artifact "$i"; then
        delayed_artifacts+=("$i")
    else
        copy_artifact "$i"
    fi

done
unset IFS

IFS=$'\n'
for i in $(find $widget_home/* -name 'liferay-*.jar' -not -path '*node_modules*'  );
do
    if is_delayed_artifact "$i"; then
        delayed_artifacts+=("$i")
    else
        copy_artifact "$i"
    fi

done
unset IFS

if [ ${#delayed_artifacts[@]} -gt 0 ]; then
    echo "Waiting 2 seconds before copying site-inializer artifacts ..."
    sleep 2

    for i in "${delayed_artifacts[@]}"; do
        copy_artifact "$i"
    done
fi

chmod -R 777 $destination/*





