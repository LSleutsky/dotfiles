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
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt menu_complete

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
autoload -U compinit && compinit -u
_comp_options+=(globdots)

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -N zsh-backward-kill-word

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

hash -d cfg="$HOME/.config"
hash -d dl="$HOME/Downloads"
hash -d docs="$HOME/Documents"
hash -d pics="$HOME/Pictures"
hash -d repos="$HOME/.local/share/repos"
hash -d vids="$HOME/Videos"

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ SOURCES                                                                                          │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

# ╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ ALIASES                                                                                          │
# ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯

alias gaa='git add --all'
alias gac='git add . && git commit -m'
alias gb="git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
alias gbd='git branch -D'
alias gbD='git push origin --delete'
alias gcam='git add . && git commit --amend'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcod='git checkout $(git_develop_branch)'
alias gcof='git checkout --'
alias gcom='git checkout $(git_main_branch)'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gD="git diff -- . ':!package-lock.json'"
alias gdn='git diff --name-only'
alias gdt='git diff-tree --no-commit-id --name-status -r'
alias gfp='git fetch --all --prune && git pull --rebase origin $(git_current_branch)'
alias gfu='git fetch upstream'
alias ggf='git push --force origin $(git_current_branch)'
alias ggfl='git push --force-with-lease origin $(git_current_branch)'
alias ggp='git push origin $(git_current_branch)'
alias glc='git log -1 HEAD --stat'
alias glo="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glp='git log --patch'
alias glst='git log --stat -p'
alias gm='git merge'
alias gpp='git pull --rebase origin $(git_current_branch) && git push origin $(git_current_branch)'
alias gpup='git pull upstream $(git_main_branch)'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbm='git rebase $(git_main_branch)'
alias grup='git rebase upstream/$(git_main_branch)'
alias grv='git revert'
alias gs="git show -- . ':!package-lock.json'"
alias gsb='git status -sb'
alias gst='git stash'
alias gsta='git stash apply'
alias gstc='git stash clear'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'

alias batt='bat /sys/class/power_supply/BAT1/capacity'
alias clock='tty-clock -bcsC4 -f %a,\ %b\ %d'
alias cls='clear'
alias df='df -h'
alias find='fd'
alias free='free -mth'
alias history='history -i'
alias ls='eza --all --binary --git --group-directories-first --icons --long'
alias mkdir='mkdir -p'
alias n='nvim'
alias sn='sudo nvim'
alias wtr='curl wttr.in'
