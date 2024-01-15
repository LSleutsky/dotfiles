#
# ~/.zshrc
#

# Functions -----------------------------------------------------------------------------------------------------

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

[[ -s /home/lush/.autojump/etc/profile.d/autojump.sh ]] && source /home/lush/.autojump/etc/profile.d/autojump.sh

source ~/.aliases

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

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
