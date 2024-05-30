#!/bin/bash

# Function to prompt for user input with a default value
prompt_user() {
    read -p "$1 [$2]: " input
    if [ -z "$input" ]; then
        echo $2
    else
        echo $input
    fi
}

# Retrieve existing Git username and email, if they exist
existing_git_username=$(git config --global user.name)
existing_git_email=$(git config --global user.email)

# Prompt for Git user name and email, using existing values as default
git_username=$(prompt_user "Enter your Git user name" "$existing_git_username")
git_email=$(prompt_user "Enter your Git email" "$existing_git_email")

# Set up basic Git configuration
git config --global user.name "$git_username"
git config --global user.email "$git_email"
git config --global core.editor "vim"
git config --global color.ui true
git config --global init.defaultBranch main
git config --global pull.rebase false

# Configure git to use delta for diffs and merges
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.features "side-by-side line-numbers decorations"
git config --global delta.decorations "none"
git config --global delta.side-by-side "true"
git config --global delta.line-numbers "true"
git config --global delta.navigate "true"
git config --global merge.conflictstyle "diff3"
git config --global mergetool.delta.cmd "delta --diff"
git config --global mergetool.delta.trustExitCode true

# Output confirmation
echo "Git configuration updated successfully!"
echo "User name: $git_username"
echo "Email: $git_email"

# Function to generate SSH keys
generate_ssh_key() {
    ssh_key_file="$HOME/.ssh/id_rsa"
    
    # Generate SSH key if it does not already exist
    if [ -f "$ssh_key_file" ]; then
        echo "SSH key already exists at $ssh_key_file"
    else
        ssh-keygen -t rsa -b 4096 -C "$git_email" -f "$ssh_key_file" -N ""
        echo "SSH key generated successfully!"
    fi
    
    # Output the SSH public key
    ssh_pub_key=$(cat "${ssh_key_file}.pub")
    echo "Your SSH public key is:"
    echo "$ssh_pub_key"
}

# Function to add SSH key to ssh-agent
add_ssh_key_to_agent() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    echo "SSH key added to the ssh-agent."
}

# Function to copy SSH key to clipboard and provide GitHub link
copy_ssh_key_and_github_instructions() {
    if command -v pbcopy &> /dev/null; then
        cat ~/.ssh/id_rsa.pub | pbcopy
        echo "SSH public key copied to clipboard."
    else
        echo "pbcopy command not found. Please manually copy your SSH public key:"
        cat ~/.ssh/id_rsa.pub
    fi
    echo "Add the SSH key to your GitHub account using the following link:"
    echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#adding-a-new-ssh-key-to-your-account"
}

# Prompt user to generate SSH key
generate_ssh_key_prompt() {
    read -p "Do you want to generate an SSH key? (yes/no): " response
    if [[ "$response" == "yes" ]]; then
        generate_ssh_key
    fi
    
    read -p "Do you want to add the SSH key to the ssh-agent? (yes/no): " add_to_agent_response
    if [[ "$add_to_agent_response" == "yes" ]]; then
        add_ssh_key_to_agent
    fi
    
    read -p "Do you want to add the SSH key to GitHub? (yes/no): " add_to_github_response
    if [[ "$add_to_github_response" == "yes" ]]; then
        copy_ssh_key_and_github_instructions
    fi
}

generate_ssh_key_prompt
