#!/bin/zsh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo -e "\nHomebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew and bundle install essential packages
echo -e "\nUpdating Homebrew and installing essential packages..."
brew update
brew bundle install

# Check for existing .fzf.* files before setting up fzf key bindings and fuzzy completion
if [ ! -f ~/.fzf.zsh ]; then
    echo "\nSetting up fzf key bindings and fuzzy completion..."
    $(brew --prefix)/opt/fzf/install --zsh
fi

# Download shell configuration
echo -e "\nDownloading shell configuration..."
curl -o ~/.zshrc https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zshrc

# Download custom aliases
echo -e "\nDownloading custom aliases..."
curl -o ~/.zsh_aliases https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zsh_aliases

# Tools configuration
echo -e "\nDownloading basic Yazi configuration..."
mkdir -p ~/.config/yazi
curl -o ~/.config/yazi/keymap.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/keymap.toml
curl -o ~/.config/yazi/theme.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/theme.toml
curl -o ~/.config/yazi/yazi.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/yazi.toml

echo -e "\nCreating basic Zellij configuration..."
mkdir ~/.config/zellij
zellij setup --dump-config > ~/.config/zellij/config.kdl

# Source .zshrc to apply changes
echo -e "\nSourcing .zshrc to apply changes..."
source ~/.zshrc

echo -e "\nShell setup complete!"

# Function to display a menu and get the user's choice
show_menu() {
    echo "Which additional setup scripts do you want to run?"
    echo "1) Git setup"
    echo "2) asdf setup"
    echo "3) mise en place setup"
    echo "4) Neovim setup"
    echo "5) None / Done"
    echo -n "Enter your choice [1-3]: "
    read choice
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
            echo -e "\nDownloading Git setup script..."
            xh -o $temp_dir/setup_git.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_git.zsh
            chmod +x $temp_dir/setup_git.zsh
            $temp_dir/setup_git.zsh
            ;;
        2)
            echo -e "\nDownloading asdf setup script..."
            xh -o $temp_dir/setup_asdf.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_asdf.zsh
            chmod +x $temp_dir/setup_asdf.zsh
            $temp_dir/setup_asdf.zsh
            ;;
        3)
            echo -e "\nDownloading mise-en-place setup script..."
            xh -o $temp_dir/setup_mise.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_mise.zsh
        4)
            echo -e "\nDownloading Neovim setup script..."
            xh -o $temp_dir/setup_neovim.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_neovim.zsh
        5)
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

echo -e "\nSetup complete! Enjoy your new development environment."

