# Initialize Starship prompt
eval "$(starship init zsh)"
# Set up the custom
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/Projects/GitHub/dotFilesAndConfigs/"

# Source custom aliases and functions
if [ -f ${XDG_CONFIG_HOME}/custom/.zsh_aliases ]; then
    source ${XDG_CONFIG_HOME}/custom/.zsh_aliases
fi

# History settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Completion settings
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Key bindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Other useful settings
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt CDABLE_VARS
# setopt CORRECT

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Load asdf
. $(brew --prefix asdf)/libexec/asdf.sh

# Initialize zoxide
eval "$(zoxide init zsh)"

# Development Environment Variables

if [ -f ${XDG_CONFIG_HOME}/custom/.env.dev ]; then
source ${XDG_CONFIG_HOME}/.env.dev
fi

# Load other scripts if needed
# For example, any additional configuration appended by scripts will be listed below

# thefuck
eval $(thefuck --alias)
