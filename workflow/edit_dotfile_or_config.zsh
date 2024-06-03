#!/bin/zsh

edit_dotfile_or_config() {
    local item=$1
    local base_dir="$XDG_DATA_HOME"
    local config_dir="$XDG_CONFIG_HOME"

    # Ensure the latest changes are pulled from the repository
    cd "$base_dir" || exit
    git pull origin main

    if [[ $item == .* ]]; then
        # It's a dotfile
        nvim "$base_dir/$item"
    else
        # It's a config directory or a file path
        local dir_path="$base_dir/$item"
        mkdir -p "$dir_path"
        eza --tree "$dir_path"

        echo "Enter the file path within $item (e.g., plugins/newplugin.ext):"
        read -r sub_path

        local full_path="$dir_path/$sub_path"
        mkdir -p "$(dirname "$full_path")"
        nvim "$full_path"
    fi

edit_dotfile_or_config "$1"
