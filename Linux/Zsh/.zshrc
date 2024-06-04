# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins to be loaded by oh-my-zsh
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  colored-man-pages
  history-substring-search
  fzf
  autojump
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration

# Keybindings for command history navigation and text editing
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# Set the history size and save history size
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Enable extended globbing
setopt extended_glob

# Make `less` more friendly for non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Initialize Homebrew environment
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Initialize Zoxide for smart directory navigation
eval "$(zoxide init zsh)"

# Aliases for commonly used commands with color options enabled
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Additional aliases for `ls` command
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsl='ls -l'
alias lsla='ls -la'

# Alias for nvim and clear
alias vim='nvim'
alias c='clear'

# Alias to send desktop notifications for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Additional aliases
alias rmrf='rm -rf' # Remove files and directories recursively and forcefully
alias code='flatpak run com.visualstudio.code 2>/dev/null' # Launch VSCode from Flatpak, suppress warnings

# Functions

# Git Shortcuts
function gs() {
    git status
}

function ga() {
    git add .
}

function gc() {
    git commit -m "$1"
}

function gp() {
    git push
}

function gcom() {
    git add .
    git commit -m "$*"
}

function lazyg() {
    git add .
    git commit -m "$*"
    git push
}

function gf() {
    git fetch
}

function gfp() {
    git fetch
    git pull
}

# Function to get the public IP address
function Get-PubIP() {
    curl -s http://checkip.amazonaws.com
}

# Function to flush the DNS cache
function flushdns() {
    sudo resolvectl flush-caches
    echo "DNS cache flushed."
}

# Function to create a directory and change into it
function mkcd() {
    if [ -z "$1" ]; then
        echo "No directory name specified."
        return
    fi

    dir="$1"
    mkdir -p "$dir" && cd "$dir"
}

# Function to find files by name
function ff() {
    if [ -z "$1" ]; then
        echo "No name specified."
        return
    fi

    name="$1"

    find . -type f -name "*${name}*" 2>/dev/null | while read -r file; do
        echo "$(dirname "$file")/$(basename "$file")"
    done
}

# Function to upload a file's content to an online pastebin service and get the URL
function hb() {
    if [ -z "$1" ]; then
        echo "No file path specified."
        return
    fi

    FilePath="$1"

    if [ -f "$FilePath" ]; then
        Content=$(cat "$FilePath")
    else
        echo "File path does not exist."
        return
    fi

    uri="http://bin.christitus.com/documents"
    response=$(curl -s -X POST -d "$Content" "$uri")

    if [[ $? -ne 0 ]]; then
        echo "Failed to upload the document."
        return
    fi

    hasteKey=$(echo $response | grep -oP '(?<="key":")[^"]*')
    url="http://bin.christitus.com/$hasteKey"
    echo "$url"
}

# Disable Powerlevel10k instant prompt autoupdate messages
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
