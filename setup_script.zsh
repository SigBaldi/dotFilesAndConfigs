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
brew install asdf bat dog dust eza fd ffmpegthumbnailer fzf git git-cliff git-delta inlyne jq lazygit poppler ripgrep starship unar wezterm xh yazi zellij zoxide

brew install --cask font-jetbrains-mono-nerd-font insomnia obsidian rectangle wezterm

# Check for existing .fzf.* files before setting up fzf key bindings and fuzzy completion
if [ ! -f ~/.fzf.zsh ]; then
    echo "Setting up fzf key bindings and fuzzy completion..."
    $(brew --prefix)/opt/fzf/install --zsh
fi

# Download shell configuration
echo -e "Downloading shell configuration..."
curl -o ~/.zshrc https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zshrc

# Download custom aliases
echo -e "Downloading custom aliases..."
curl -o ~/.zsh_aliases https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zsh_aliases

# Download tools configuration
echo -e "Downloading basic Yazi configuration..."
mkdir -p ~/.config/yazi
curl -o ~/.config/yazi/keymap.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/keymap.toml
curl -o ~/.config/yazi/theme.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/theme.toml
curl -o ~/.config/yazi/yazi.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/yazi.toml

# Source .zshrc to apply changes
echo -e "Sourcing .zshrc to apply changes..."
source ~/.zshrc

echo -e "Shell setup complete!"

# Function to display a menu and get the user's choice
show_menu() {
    echo -e "Which additional setup scripts do you want to run?"
    echo "1) Git setup"
    echo "2) asdf setup"
    echo "3) None / Done"
    read -p "Enter your choice [1-3]: " choice
    return $choice
}

# Create a temporary directory for setup scripts
temp_dir=$(mktemp -d)

# Loop to show menu and run additional setup scripts
while true; do
    show_menu
    choice=$?
    case $choice in
        1)
            echo -e "Downloading Git setup script..."
            xh -o $temp_dir/setup_git.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_git.zsh
            chmod +x $temp_dir/setup_git.zsh
            $temp_dir/setup_git.zsh
            ;;
        2)
            echo -e "Downloading asdf setup script..."
            xh -o $temp_dir/setup_asdf.sh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_asdf.sh
            chmod +x $temp_dir/setup_asdf.sh
            $temp_dir/setup_asdf.sh
            ;;
        3)
            echo "No additional setup scripts will be run."
            break
            ;;
        *)
            echo "Invalid choice. Please select again."
            ;;
    esac
done

# Clean up the temporary directory
echo "Cleaning up the temporary directory..."
rm -rf $temp_dir

echo "Setup complete! Enjoy your new development environment."
# TODO: Add Neovim setup script.
