#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.aliases
source /usr/share/autojump/autojump.bash

PS1='[\u@\h \W]\$ '
# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  . /usr/share/bash-completion/bash_completion

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'

export ARCHFLAGS="-arch x86_64"
export LANG="en_US.UTF-8"
export LC_ALL="$LANG"
export LC_CTYPE="$LANG"
export ZSH="$HOME/.oh-my-zsh"
export SYSTEM_INIT="systemd"

export EDITOR=lvim
export GHQ_ROOT="/home/lush/ghq"
export PAGER=less

export XDG_CONFIG_HOME="/home/lush/.config"
export XDG_CACHE_HOME="/home/lush/.cache"
export XDG_DATA_HOME="/home/lush/.local/share"
export XDG_STATE_HOME="/home/lush/.local/state"

export AWS_ACCESS_KEY_ID=AKIAVFBYU3KLK7YGTDQV
export AWS_SECRET_ACCESS_KEY=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
export AWS_DEFAULT_REGION=us-east-1

export PATH="/home/lush/.console-ninja/.bin:$PATH"
export PATH="/home/lush/.local/share/fnm:$PATH"
export PATH="/home/lush/go/bin:$PATH"
export PATH="/home/lush/.cargo/bin:$PATH"

eval "$(starship init bash)"
eval "`fnm env`"
