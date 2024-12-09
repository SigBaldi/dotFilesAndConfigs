#!/usr/bin/env zsh

# Check if we're inside a Git repository
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then

  # Get the local branch name or commit hash if in detached HEAD state
  branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  
  # Get the remote tracking branch
  upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
  
  # Format remote branch if it exists
  if [[ -n "$upstream" ]]; then
    remote_branch=":$upstream"
  else
    remote_branch=""
  fi
  
  # Output in the desired format
  echo "$branch$remote_branch"
fi

