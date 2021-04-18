# ALIASES
## Collection of useful aliases divided by category.

# Example
# alias zshconfig="code ~/.zshrc"

############
#          #
#  Finder  #
#          #
############
 
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Screensaver
if [[ -f "/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine" ]]; then
    alias ss="open -a ScreenSaverEngine"
fi

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

#########
#       #
#  GIT  #
#       #
#########

# Shallow clone a repo, narrowed to master
alias gcs="git clone depth 1"

# Cleanup merged branches
alias gbclean="!f() { git branch --merged ${1-master} | grep -v ' ${1-master}$' | xargs -r git branch -d; }; f"

# Amend last commit
alias gam="git commit --amend -m"

# Grep for a term in codebase, starting at current folder
alias grip="git grep -li"

# Grep for a term in codebase, starting at root folder
# alias gripr="!f() { A=$(pwd) && TOPLEVEL=$(git rev-parse --show-toplevel) && cd $TOPLEVEL && git grep --full-name -In $1 | xargs -I{} echo $TOPLEVEL/{} && cd $A; }; f"

##############
#            #
#  Homebrew  #
#            #
##############

# Homebrew maintenance
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

##########
#        #
#  Node  #
#        #
##########

alias freeport="lsof-P -t -i tcp:$1 | xargs kill"

#########
#       #
#  NPM  #
#       #
#########

# Update NPM
alias npmup="npm install -g npm"
# List NPM Global Dependencies
alias npmgl="npm list -g --depth=0"

# Check NPM Global Dependencies for updates
alias npmgo="npm outdated -g --depth=0"

# Update NPM Global Dependencies
alias npmgu="npm update -g --depth=0"

###########
#         #
#  Shell  #
#         #
###########

# Edit this file
alias aliases="vim ~/.oh-my-zsh/custom/aliases.zsh"

# Configure ZSH
alias zshconfig="vim ~/.zshrc"

# Configure Oh My ZSH
alias ohmyzsh="vim ~/.oh-my-zsh/oh-my-zsh.sh"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"

# Preview in Terminal window... (requires fzf, can be installed running `brew install fzf`)
alias preview="fzf --preview 'bat --color \"always\" {}'"

# ...and add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
