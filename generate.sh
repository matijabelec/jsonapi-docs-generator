#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters"
    echo "Use '$SCRIPT_DIR/generate.sh notes Note Notes' as example."
    exit 2
fi

RESOURCE_TYPE_NAME=$1
RESOURCE_NAME=$2
RESOURCES_NAME=$3

cp -f "$SCRIPT_DIR/include/templates/resource.apib" "$SCRIPT_DIR/build/temp_resource.apib"
sed -i '' "s/{RESOURCE_TYPE_NAME}/$RESOURCE_TYPE_NAME/g" "$SCRIPT_DIR/build/temp_resource.apib"
sed -i '' "s/{RESOURCE_NAME}/$RESOURCE_NAME/g" "$SCRIPT_DIR/build/temp_resource.apib"

cp -f "$SCRIPT_DIR/include/templates/group.apib" "$SCRIPT_DIR/build/temp_group.apib"
sed -i '' "s/{RESOURCE_TYPE_NAME}/$RESOURCE_TYPE_NAME/g" "$SCRIPT_DIR/build/temp_group.apib"
sed -i '' "s/{RESOURCE_NAME}/$RESOURCE_NAME/g" "$SCRIPT_DIR/build/temp_group.apib"
sed -i '' "s/{RESOURCES_NAME}/$RESOURCES_NAME/g" "$SCRIPT_DIR/build/temp_group.apib"

cp "$SCRIPT_DIR/build/temp_group.apib" "$SCRIPT_DIR/src/groups/$RESOURCE_TYPE_NAME.apib"
cp "$SCRIPT_DIR/build/temp_resource.apib" "$SCRIPT_DIR/src/resources/$RESOURCE_TYPE_NAME.apib"
