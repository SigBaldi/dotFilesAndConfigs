#!/bin/bash

update_dotfile_or_config() {
    local item=$1
    local base_dir="$XDG_DATA_HOME"
    local config_dir="$XDG_CONFIG_HOME"

    if [[ $item == .* ]]; then
        # It's a dotfile
        cp "$base_dir/$item" "$config_dir/"
    else
        # It's a config directory or a file path
        local dir_path="$base_dir/$item"
        mkdir -p "$config_dir/$item"
        cp -r "$dir_path/"* "$config_dir/$item/"
    fi

    cd "$base_dir" || exit
    git add .
    git commit -m "Update $item"
    git push origin main

    source "$config_dir/$item"
}

update_dotfile_or_config "$1"
