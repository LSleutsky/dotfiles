#
# ~/.zshrc
#

source /home/lush/.aliases
source /etc/profile.d/autojump.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt appendhistory
setopt autocd autopushd
autoload -U compinit; compinit
_comp_options+=(globdots)

bindkey -e

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"
