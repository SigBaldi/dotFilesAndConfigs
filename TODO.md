# Additions planned or to investigate:

1. From TJDeVries Git config:
`[core]
  editor = nvim
	excludesFile = ~/.gitignore

  pager = delta
    ; autocrlf = input

[pull]
  rebase = true

[rebase]
  autoStash = true

[alias]
  lg = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative

[push]
  default = current

[delta]
  line-numbers = true
  syntax-theme = gruvbox
  side-by-side = false

  file-modified-label = modified:

[interactive]
  diffFilter = delta --color-only
[credential "https://github.com"]
	helper = 
	helper = !/usr/bin/gh auth git-credential
  `
  1. From TJDeVries Wezterm config:
 `
-- default is true, has more "native" look
config.use_fancy_tab_bar = false

config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"
`
1. From TJDeVries zsh config and mine:
  -Update how I source my customizations to the following:

```bash
  # Define source files
sources=(
    'aliases'
    'functions'
    'git'
    'pyenv'
)

# Source each plugin file
for source in "${sources[@]}"; do
    source_file="${XDG_CONFIG_HOME}/custom/zsh/${source}.zsh"
    if [ -f "$source_file" ]; then
        source "$source_file"
    else
        echo "Warning: Source file $source_file not found"
    fi
done
```
  -move git aliases to git config
  -move functions to functions config
  -move everything to a zsh folder in custom

1. 