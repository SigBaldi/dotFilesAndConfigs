#!/bin/zsh

# Create Neovim configuration directory
echo "Setting up Neovim..."
mkdir -p "$XDG_CONFIG_HOME/nvim"

# Download NeoVim configuration based on kickstart.nvim, forked and added to this repo as nvim
echo "Downloading NeoVim configuration..."
curl -o "$XDG_CONFIG_HOME/nvim/" "$XDG_DATA_HOME/nvim"

echo "Neovim setup complete!"
echo "Open Neovim and run ':Lazy sync' to install the specified plugins."
# TODO: add question to set git editor config to nvim