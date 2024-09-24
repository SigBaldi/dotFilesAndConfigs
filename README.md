# dotFilesAndConfigs

Like gems hide in stone, `dotFiles` are hidden in your system but provide us with countless functionalities.
Here are the ones I treasure.
Includes different configs – nvim, wezterm, yazi, zellij – and a workflow to manage them.

## Shell Config

The [.zshrc](.zshrc) file provides similar functionalities to Oh My Zsh while using Starship, sources my aliases from a separate file. Any dotfile and config can be added/updated via the workflow commands aliased below.

## Aliases - Collection of useful aliases divided by category

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
- Config Mangement Workflow - Commands:

```bash
edit_config <filename or path>
update_config <filename or path>
manage_config <filename or path>
```

## Other Tools

Contains separate configs for other tools as directories:

- nvim (Neovim)
- wezterm
- yazi
- zellij

### NeoVim: hyperextensible Vim-based text editor

Set up Neovim with a basic configuration and plugin setup.
This setup includes:

- Basic Neovim settings for a better editing experience.
- Plugin management using lazy.nvim.
- Essential plugins for file exploration, LSP, autocompletion, status line, syntax highlighting, and fuzzy finding.
- A popular colorscheme (Gruvbox) for better visuals.

### Yazi: Blazing fast terminal file manager written in Rust, based on async I/O

Default configuration from the latest tag in <https://github.com/sxyazi/yazi/tree/latest/yazi-config/preset>.

### Zellij: A terminal workspace with batteries included

Based on the default config from [Zellij.dev](https://zellij.dev/documentation/configuration).

## Installation

The script included can setup:

- a ZSH shell,
- your GIT config (optional),
- Node LTS and Python latest via asdf,
- NeoVim with Kickstart.nvim and further customisations.

Download the [setup_script.zsh](setup_script.zsh) and make it executable.

```bash
% chmod +x setup_script.sh"
% ./setup_script.zsh"
```
