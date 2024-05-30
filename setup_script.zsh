#!/bin/zsh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo -e "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew and install essential packages
echo -e "Updating Homebrew and installing essential packages..."
brew update
brew install asdf bat delta dog dust eza fd ffmpegthumbnailer fzf git git-cliff inlyne jq lazygit poppler ripgrep starship unar wezterm xh yazi zellij zoxide

brew install --cask font-jetbrains-mono-nerd-font insomnia obsidian rectangle wezterm

# Check for existing .fzf.* files before setting up fzf key bindings and fuzzy completion
if [ -f ~/.fzf.bash ] && [ -f ~/.fzf.zsh ]; then
    echo "Both .fzf.bash and .fzf.zsh files exist. Deleting the redundant one."
    if [ "$SHELL" = "/bin/zsh" ]; then
        rm ~/.fzf.bash
    elif [ "$SHELL" = "/bin/bash" ]; then
        rm ~/.fzf.zsh
    fi
fi

if [ ! -f ~/.fzf.bash ] && [ ! -f ~/.fzf.zsh ]; then
    echo "Setting up fzf key bindings and fuzzy completion..."
    $(brew --prefix)/opt/fzf/install --all
fi


# Download shell configuration
echo -e "Downloading shell configuration..."
curl -o ~/.zshrc https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zshrc

# Download custom aliases
echo -e "Downloading custom aliases..."
curl -o ~/.zsh_aliases.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/zsh_aliases.zsh

# Source .zshrc to apply changes
echo -e "Sourcing .zshrc to apply changes..."
source ~/.zshrc

# Download tools configuration
# echo -e "Downloading basic Yazi configuration..."
# curl -o ~/.config/yazi/keymap.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/keymap.toml
# curl -o ~/.config/yazi/theme.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/theme.toml
# curl -o ~/.config/yazi/yazi.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/yazi.toml

# Install Node.js using asdf
echo -e "Installing Node.js using asdf..."
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts

# Install Python using asdf
echo -e "Installing Python using asdf..."
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf install python latest
asdf global python latest

# Install Poetry for Python package management
echo -e "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.zshrc

# Source .zshrc to apply changes
echo -e "Sourcing .zshrc to apply changes..."
source ~/.zshrc

echo -e "Setup complete! Enjoy your new development environment."

# Function to display a menu and get the user's choice
show_menu() {
    echo -e "Do you want to run additional setup scripts?"
    echo "1) Git setup"
    echo "2) None"
    read -p "Enter your choice [1-2]: " choice
    return $choice
}

# Show menu and get the user's choice
show_menu
choice=$?

# Run additional setup scripts based on user's choice
case $choice in
    1)
        ./setup_git.zsh
        ;;
    2)
        echo -e "No additional setup scripts will be run."
        ;;
    *)
        echo -e "Invalid choice. No additional setup scripts will be run."
        ;;
esac

# TODO: Add Neovim setup script.