#!/bin/zsh

# Create Neovim configuration directory
echo "Setting up Neovim..."
mkdir -p "$XDG_CONFIG_HOME/nvim"

# Copy NeoVim configuration based on kickstart.nvim, forked and added to this repo as nvim
echo "Copying NeoVim configuration..."
cp -r "$XDG_DATA_HOME/nvim" "$XDG_CONFIG_HOME/nvim"

#Ask to set git editor config to nvim
setNeovimAsGitEditor() {
    read -r -p "Do you want to set your git editor to Neovim? (y/n) " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    git config --global core.editor nvim
}
setNeovimAsGitEditor

echo "Neovim setup complete!"
echo "Open Neovim and run ':Lazy sync' to install the specified plugins."
