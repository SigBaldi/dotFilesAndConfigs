#!/bin/zsh

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo -e "\nHomebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew and install essential packages
echo -e "\nUpdating Homebrew and installing essential packages..."
brew update
brew install asdf bat broot dust eza fd ffmpegthumbnailer fzf git git-cliff git-delta inlyne jq lazygit poppler ripgrep starship thefuck unar wezterm xh yazi zellij zoxide

brew install --cask font-jetbrains-mono-nerd-font insomnia obsidian rectangle wezterm

# Check for existing .fzf.* files before setting up fzf key bindings and fuzzy completion
if [ ! -f ~/.fzf.zsh ]; then
    echo "\nSetting up fzf key bindings and fuzzy completion..."
    $(brew --prefix)/opt/fzf/install --zsh
fi

# Download shell configuration
echo -e "\nDownloading shell configuration..."
curl -o ~/.zshrc https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/.zshrc

# Download prompt configuration
echo -e "\nDownloading starship configuration..."
curl -o ~/.config/starship/starship.toml https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/starship/starship.toml
curl -o ~/.config/starship/git_branch_prompt.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/starship/git_branch_prompt.zsh
curl -o ~/.config/starship/git_status_prompt.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/starship/git_status_prompt.zsh

# Download custom aliases
echo -e "\nDownloading custom aliases..."
curl -o ~/.config/custom/.zsh_aliases https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/main/custom/.zsh_aliases

# Download tools configuration
echo -e "\nDownloading basic Yazi configuration..."
mkdir -p ~/.config/yazi
curl -o ~/.config/yazi/keymap.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/keymap.toml
curl -o ~/.config/yazi/theme.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/theme.toml
curl -o ~/.config/yazi/yazi.toml https://raw.githubusercontent.com/sxyazi/yazi/latest/yazi-config/preset/yazi.toml

# Source .zshrc to apply changes
echo -e "\nSourcing .zshrc to apply changes..."
source ~/.zshrc

echo -e "\nShell setup complete!"

# Function to display a menu and get the user's choice
show_menu() {
    echo "Which additional setup scripts do you want to run?"
    echo "1) Git setup"
    echo "2) asdf setup"
    echo "3) NeoVim setup"
    echo "4) Terminal Emulator setup"
    echo "5) None / Done"
    echo -n "Enter your choice [1-5]: "
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
            echo -e "\nDownloading NeoVim setup script..."
            xh -o $temp_dir/setup_neovim.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_neovim.zsh
            chmod +x $temp_dir/setup_neovim.zsh
            $temp_dir/setup_neovim.zsh
            break
            ;;

        4)
            echo -e "\nDownloading Terminal Emulator setup script..."
            xh -o $temp_dir/setup_terminal.zsh https://raw.githubusercontent.com/SigBaldi/dotFilesAndConfigs/master/setup_terminal.zsh
            chmod +x $temp_dir/setup_terminal.zsh
            $temp_dir/setup_terminal.zsh
            break
            ;;
:s
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
