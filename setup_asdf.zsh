#!/bin/zsh

# Set up asdf for managing versions
# echo -e "Setting up asdf..."
# source $(brew --prefix asdf)/asdf.sh 

# Update asdf and add necessary plugins
asdf update

# Install Node.js using asdf
echo -e "Installing Node.js using asdf..."
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Import the Node.js release team's PGP keyring for security
# This ensures that the downloaded binaries are authentic and from a trusted source
zsh ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# Resolve the latest LTS version and install the latest minor version
latest_lts_major=$(asdf nodejs resolve lts)
latest_lts=$(asdf list-all nodejs | grep -E "^${latest_lts_major}\.[0-9]+\.[0-9]+$" | tail -1)
asdf install nodejs $latest_lts
asdf global nodejs $latest_lts

# Install Python using asdf
echo -e "Installing Python using asdf..."
asdf plugin add python https://github.com/danhper/asdf-python.git
latest_python=$(asdf list-all python | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | tail -1)
asdf install python $latest_python
asdf global python $latest_python

# Install Poetry for Python package management
echo -e "Installing Poetry..."
curl -sSL https://install.python-poetry.org | python3 -
# Add Poetry to the Path
export PATH="$HOME/.poetry/bin:$PATH"

# Source .zshrc to apply changes
echo -e "Sourcing .zshrc to apply changes..."
source ~/.zshrc

echo -e "asdf setup complete! Node.js (LTS) and Python (latest) have been installed and configured."
