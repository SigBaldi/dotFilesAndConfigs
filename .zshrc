# Initialize Starship prompt
eval "$(starship init zsh)"

# Source custom aliases and functions
if [ -f ~/.config/.zsh_aliases ]; then
    source ~/.config/.zsh_aliases
fi

# History settings
HISTSIZE=10000
SAVEHIST=10000
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
setopt CORRECT

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Load asdf
. $(brew --prefix asdf)/asdf.sh

# Load other scripts if needed
# For example, source any additional configuration files here

