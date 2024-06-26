#!/bin/zsh


# Create WezTerm configuration directory
echo "Setting up WezTerm..."
mkdir -p "$XDG_CONFIG_HOME/wezterm"

# Download Wezterm configuration
echo "Downloading Wezterm configuration..."
curl -o "$XDG_CONFIG_HOME/wezterm/" "$XDG_DATA_HOME/wezterm.lua"

echo "WezTerm setup complete!"
echo "Open WezTerm, you're now ready to go!"
