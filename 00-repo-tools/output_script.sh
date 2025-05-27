#!/usr/bin/env bash

echo "| Folder | README | Example | AVM |" > output.md
echo "|--------|--------|---------|-----|" >> output.md

find . -type f -name "main.tf" -not -path "*example*" -not -path "*test*" | sort | while read -r main_tf; do
    folder=$(dirname "$main_tf")
    folder_name=$(basename "$folder")
    readme_link="[README.md]($folder/README.md)"
    if [ -d "$folder/example" ]; then
        example_link="[example]($folder/example)"
    elif [ -d "$folder/examples" ]; then
        example_link="[examples]($folder/examples)"
    else
        example_link=""
    fi
    if grep -q "Azure/avm" "$folder"/*; then
        avm_status=":white_check_mark:"
    else
        avm_status=":x:"
    fi
    echo "| [$folder_name]($folder) | $readme_link | $example_link | $avm_status |" >> output.md
done