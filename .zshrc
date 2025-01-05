#
# ~/.zshrc
#

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ FUNCTIONS                                                                                        │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

function git_current_branch() {
  ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
  echo $ref
}

function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

function zsh-backward-kill-word () {
  local WORDCHARS=''
  zle -f kill
  zle backward-kill-word
}

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ OPTIONS                                                                                          │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_list
setopt auto_menu
setopt auto_pushd
setopt complete_in_word
setopt correct
setopt extended_glob
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt menu_complete
setopt pushd_ignore_dups

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U compinit && compinit -u
_comp_options+=(globdots)

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N zsh-backward-kill-word

zstyle ':completions*' accept-exact '*(N)'
zstyle ':completions*' use-cache on
zstyle ':completions*' cache-path ~/.cache/zcache
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion::complete:*' gain-privileges 1

if [[ "$CASE_SENSITIVE" = true ]]; then
  zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
  if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
  else
    zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
  fi
fi

unset CASE_SENSITIVE HYPHEN_INSENSITIVE

bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey '^w' zsh-backward-kill-word

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ ENVIRONMENT                                                                                      │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

export HISTFILE=~/.zsh_history
export HISTFILESIZE=100000
export HISTSIZE=100000
export SAVEHIST=100000

export EDITOR="nvim"
export LANG="en_US.UTF-8"
export PAGER="less"
export SUDO_EDITOR="nvim"

export GDK_BACKEND="wayland"
export GTK_THEME="Adwaita:dark"
export GTK2_RC_FILES="/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc"
export QT_QPA_PLATFORM="wayland;xcb"
export QT_STYLE_OVERRIDE="Adwaita-Dark"
export XDG_SESSION_DESKTOP="Hyprland"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

export PATH="/home/lush/.bun/bin:$PATH"

hash -d cfg="$HOME/.config"
hash -d dl="$HOME/Downloads"
hash -d docs="$HOME/Documents"
hash -d pics="$HOME/Pictures"
hash -d repos="$HOME/.local/share/repos"
hash -d vids="$HOME/Videos"

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ SOURCES                                                                                          │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ ALIASES                                                                                          │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

# git
alias gaa='git add --all'
alias gac='git add --all && git commit -m'
alias gb="git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
alias gbd='git branch -D'
alias gbD='git push origin --delete'
alias gcam='git add . && git commit --amend'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcod='git checkout $(git_develop_branch)'
alias gcof='git checkout --'
alias gcom='git checkout $(git_main_branch)'
alias gd='git diff'
alias gD="git diff -- . ':!package-lock.json'"
alias gdn='git diff --name-only'
alias gdt='git diff-tree --no-commit-id --name-status -r'
alias gfp='git fetch --all --prune && git pull --rebase origin $(git_current_branch)'
alias ggf='git push --force origin $(git_current_branch)'
alias ggp='git push origin $(git_current_branch)'
alias glo="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gpp='git pull --rebase origin $(git_current_branch) && git push origin $(git_current_branch)'
alias grb='git rebase'
alias gsb='git status -sb'
alias gst='git stash'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'

alias nh='nvim ~/.local/share/repos/dotfiles/hypr/hyprland.conf'
alias nk='nvim ~/.local/share/repos/dotfiles/kitty/kitty.conf'
alias ns='nvim ~/.local/share/repos/dotfiles/starship.toml'
alias nz='nvim ~/.local/share/repos/dotfiles/.zshrc'

alias asciiquarium='asciiquarium -t'
alias batt='bat /sys/class/power_supply/BAT1/capacity'
alias clock='tty-clock -bcsC4 -f %a,\ %b\ %d'
alias cls='clear'
alias copy='wl-copy'
alias df='df -h'
alias find='fd'
alias free='free -mth'
alias grep='grep --color=auto'
alias history='history -i'
alias j='z'
alias ls='eza --all --binary --git --group-directories-first --icons --long'
alias lt='eza --all --binary --git --group-directories-first --icons --long --tree'
alias man='batman'
alias mkdir='mkdir -p'
alias n='nvim'
alias paste='wl-paste'
alias pow='sudo poweroff'
alias reb='sudo reboot'
alias sn='sudo nvim'
alias uuid='lsblk -dno UUID'
alias wtr='curl wttr.in'

#linux
alias open='xdg-open'

#hyprland
alias hyprload='hyprctl reload && hyprctl dispatch exec reload'

#arch
alias pacman='sudo pacman'
alias pacdel='sudo pacman -Rnsudd'
alias packill='sudo rm -rf /var/lib/pacman/db.lck'
alias pacwipe='sudo pacman -Rnsudd $(pacman -Qtdq)'
alias pacupdate='sudo pacman -Syyu && yay -Syu --devel'
alias yaywipe='sudo yay -Scc'

# void
alias vsv='sudo vsv'
alias xbi='sudo xbps-install -Su'
alias xbq='xbps-query'
alias xbqs='xbps-query -Rs'
alias xbr='sudo xbps-reconfigure'

# fedora
alias dnf='sudo dnf'
alias dnfs='sudo dnf search'
alias dnfi='sudo dnf install'
alias dnfu='sudo dnf update --refresh'
alias fpi='sudo flatpak install flathub'
alias fpu='sudo flatpak update'
alias fps='flatpak search'

# bun completions
[ -s "/home/lush/.bun/_bun" ] && source "/home/lush/.bun/_bun"

# fnm
FNM_PATH="/home/lush/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/lush/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
