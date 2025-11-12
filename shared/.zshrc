# Shared Zsh Configuration
# Works across macOS and Ubuntu

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE

# Shell behavior
setopt AUTO_CD              # cd by typing directory name
setopt CORRECT              # Correct typos
setopt AUTO_PUSHD           # Push directories onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates

# Environment Variables
export EDITOR="vim"
export VISUAL="vim"

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Basic navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Quick navigation shortcuts
alias projects='cd ~/Projects'
alias downloads='cd ~/Downloads'
alias desktop='cd ~/Desktop'

# Shell utilities
alias reload='source ~/.zshrc'
alias editrc='${EDITOR} ~/.zshrc'

# Utility function - make directory and cd into it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}

# Find and kill process by port
function killport() {
    lsof -ti:$1 | xargs kill -9
}

# Helper function to load config files
zsh_load_file() {
    local file="$1"
    if [[ -f "$file" ]]; then
        source "$file"
    fi
}

# Load configuration files in order
zsh_load_file ~/.env-detection
zsh_load_file ~/.aliases
zsh_load_file ~/.modern-aliases

# Load platform-specific configurations
zsh_load_file ~/.zshrc.local

# Completion system
autoload -Uz compinit
# Use cached completion if zcompdump exists and is recent
if [[ -f ~/.zcompdump ]]; then
    compinit -C
else
    compinit
fi

# Docker CLI completions (if Docker Desktop installed)
if [ -d "$HOME/.docker/completions" ]; then
    fpath=("$HOME/.docker/completions" $fpath)
fi

# Bun completions (if installed)
if [ -s "$HOME/.bun/_bun" ]; then
    source "$HOME/.bun/_bun"
fi
