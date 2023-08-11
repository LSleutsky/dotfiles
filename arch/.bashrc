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

eval "$(starship init bash)"
eval "`fnm env`"
