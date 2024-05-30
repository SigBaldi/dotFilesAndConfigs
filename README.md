
# dotFilesAndConfigs
Like gems hide in stone, `dotFiles` are hidden in your system but provide us with countless functionalities.
Here are the ones I treasure.

## Shell Config
The [.zshrc](.zshrc) file provides similar functionalities to Oh My Zsh while using Starship and sources my aliases from a separate file. 
## Aliases - Collection of useful aliases divided by category.
The file [.zsh_aliases.zsh](.zsh_aliases.zsh) contains the following categories:

- Shell
- System
- Directory
- GIT
- Homebrew
- Node
- NPM
- Docker
- Custom Functions

## Other Tools
The .config/ folder contains separate configs for other tools:
- nvim (Neovim)
- yazi
- zellij

### NeoVim: hyperextensible Vim-based text editor
Set up Neovim with a basic configuration and plugin setup.
This setup includes:

- Basic Neovim settings for a better editing experience.
- Plugin management using lazy.nvim.
- Essential plugins for file exploration, LSP, autocompletion, status line, syntax highlighting, and fuzzy finding.
- A popular colorscheme (Gruvbox) for better visuals.

### Yazi: Blazing fast terminal file manager written in Rust, based on async I/O.

### Zellij: A terminal workspace with batteries included


## Installation
The script included can setup a ZSH shell, Neovim and your GIT config.

Download the [setup_script.zsh](setup_script.zsh) and make it executable.

```
% chmod +x setup_script.sh"
% ./setup_script.zsh"
```