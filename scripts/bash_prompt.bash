#!/bin/bash

# --- Custom Prompt & Git Logic ---

function git_branch() {
  local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)"
  if [[ -n "$branch" ]]; then
    echo "[$branch] "
  fi
}

colorize_git_prompt() {
    local git_status="$(git status 2>/dev/null)"
    if [[ -n "$(echo "$git_status" | grep "Changes not staged for commit")" ]]; then
        echo -e "\033[31m"  # Red
    elif [[ -n "$(echo "$git_status" | grep "Changes to be committed")" ]]; then
        echo -e "\033[32m"  # Green
    else
        echo -e "\033[m"   # Default
    fi
}

# Set PS1
PS1='$(colorize_git_prompt)$(git_branch)\[\033[0;32m\]\u@\h\[\033[0m\]:\[\033[0;34m\]\w\[\033[0m\]\$ '

# --- Aliases ---
alias ll='ls -la'
alias ..='cd ..'
alias grep='grep --color=auto'

# --- Bash Completion (Linux Path) ---
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi