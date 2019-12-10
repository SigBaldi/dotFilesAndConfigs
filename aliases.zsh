# ALIASES
## Collection of useful aliases divided by category.
#
# Example
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
############
#          #
#  Finder  #
#          #
############
# 
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"\
#
# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
#
# Shortcuts
alias d="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
#
##############
#            #
#  Homebrew  #
#            #
##############
#
# Homebrew miantenance
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
#
#########
#       #
#  NPM  #
#       #
#########
#
# List NPM Global Dependencies
alias npmgl='npm list -g --depth=0'
# Check NPM Global Dependencies for updates
alias npmgo='npm outdated -g --depth=0'
# Update NPM Global Dependencies
alias npmgu='npm update -g --depth=0'
#
###########
#         #
#  Shell  #
#         #
###########
#
# Configure Oh My ZSH
alias ohmyzsh="vim ~/.oh-my-zsh"
#
# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
#
# Preview in Terminal window
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
#
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
#
# Configure ZSH
alias zshconfig="vim ~/.zshrc"