# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  colored-man-pages
  history-substring-search
  fzf
  autojump
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# User configuration

# No poner líneas duplicadas o líneas que empiecen con espacio en el historial.
HISTCONTROL=ignoreboth

# Añadir al archivo de historial, no sobrescribirlo
setopt APPEND_HISTORY

# Ver la longitud del historial
HISTSIZE=1000
SAVEHIST=2000

# Habilitar globbing avanzado
setopt extended_glob

# Hacer que `less` sea más amigable con archivos no textuales
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Los añadidos piola baby
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Alias personalizados
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alias adicionales para ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsl='ls -l'
alias lsla='ls -la'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Zoxide added functionality
eval "$(zoxide init zsh)"

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

# function g() {
#     cd ~/Github
# }

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

# System Utilities
function hb() {
    if [ -z "$1" ];then
        echo "No file path specified."
        return
    fi

    FilePath="$1"

    if [ -f "$FilePath";then
        Content=$(cat "$FilePath")
    else
        echo "File path does not exist."
        return
    fi

    uri="http://bin.christitus.com/documents"
    response=$(curl -s -X POST -d "$Content" "$uri")

    if [[ $? -ne 0 ]];then
        echo "Failed to upload the document."
        return
    fi

    hasteKey=$(echo $response | grep -oP '(?<="key":")[^"]*')
    url="http://bin.christitus.com/$hasteKey"
    echo "$url"
}

# Editor Configuration
function ff() {
    if [ -z "$1";then
        echo "No name specified."
        return
    fi

    name="$1"

    find . -type f -name "*${name}*" 2>/dev/null | while read -r file; do
        echo "$(dirname "$file")/$(basename "$file")"
    done
}

# Network Utilities
function Get-PubIP() {
    curl -s http://checkip.amazonaws.com
}

# Directory Management
function mkcd() {
    if [ -z "$1";then
        echo "No directory name specified."
        return
    fi

    dir="$1"
    mkdir -p "$dir" && cd "$dir"
}

# Networking Utilities
function flushdns() {
    sudo resolvectl flush-caches
    echo "DNS cache flushed."
}

# Más alias
alias rmrf='rm -rf' # Remove with all subdirectories and permissions
alias code='flatpak run com.visualstudio.code 2>/dev/null' # Just to have easy access to vscode from flatpak and ignore the warning

# Para remover problemas con autoupdate
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Autoupdate al arrancar
#sudo apt update -y > /dev/null 2>&1 &&
#sudo apt upgrade -y > /dev/null 2>&1 &&
#sudo apt autoremove -y > /dev/null 2>&1
#echo "Repositorios actualizados..."
