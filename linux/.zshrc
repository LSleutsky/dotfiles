#
# ~/.zshrc
#

zsh-backward-kill-word () {
  local WORDCHARS=''
  zle -f kill
  zle backward-kill-word
}

[[ -s /home/lush/.autojump/etc/profile.d/autojump.sh ]] && source /home/lush/.autojump/etc/profile.d/autojump.sh

source ~/.aliases
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-functions.zsh

setopt append_history
setopt auto_cd
setopt auto_pushd
setopt auto_list
setopt menu_complete
setopt complete_in_word
setopt always_to_end

autoload -U compinit && compinit -u
_comp_options+=(globdots)

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
bindkey '^w' zsh-backward-kill-word

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
