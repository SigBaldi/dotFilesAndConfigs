#!/bin/zsh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew and install essential packages
echo "Updating Homebrew and installing essential packages..."
brew update
brew install bat delta dog dust eza fd ffmpegthumbnailer fzf git git-cliff inlyne jq lazigit poppler ripgrep starship unar wezterm xh yazi zellij zoxide

brew install --cask font-jetbrains-mono-nerd-font insomnia obsidian rectangle wezterm

# Set up Starship prompt
echo "Setting up Starship prompt..."
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Download shell configuration
echo "Downloading shell configuration..."
curl -o ~/.zshrc https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zshrc

# Download custom aliases
echo "Downloading custom aliases..."
curl -o ~/.zsh_aliases.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/zsh_aliases.zsh

# Download tools configuration
echo "Downloading basic Yazi configuration..."
curl - ~/.config/yazi/keymap.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/keymap.toml
curl - ~/.config/yazi/theme.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/theme.toml
curl - ~/.config/yazi/yazi.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/yazi.toml

# Install fzf key bindings and fuzzy completion
echo "Setting up fzf key bindings and fuzzy completion..."
$(brew --prefix)/opt/fzf/install

# Set up asdf for managing versions
echo "Setting up asdf..."
echo -e "\n. $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc

# Install Node.js using asdf
echo "Installing Node.js using asdf..."
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts

# Install Python using asdf
echo "Installing Python using asdf..."
asdf plugin add python https://github.com/danhper/asdf-python.git
asdf install python latest
asdf global python latest

# Install Poetry for Python package management
echo "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -
echo 'export PATH="$HOME/.poetry/bin:$PATH"' >> ~/.zshrc

# Source .zshrc to apply changes
echo "Sourcing .zshrc to apply changes..."
source ~/.zshrc

echo "Setup complete! Enjoy your new development environment."

# Function to display a menu and get the user's choice
show_menu() {
    echo "Do you want to run additional setup scripts?"
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
        ./setup_git.sh
        ;;
    2)
        echo "No additional setup scripts will be run."
        ;;
    *)
        echo "Invalid choice. No additional setup scripts will be run."
        ;;
esac

# TODO: Add Neovim setup script.