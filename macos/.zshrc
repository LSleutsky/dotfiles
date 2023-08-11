[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="true"

ZSH_DISABLE_COMPFIX=true

plugins=(
  autoupdate
  aws
  aliases
  brew
  colored-man-pages
  common-aliases
  composer
  docker
  dotenv
  fast-syntax-highlighting
  gh
  git
  git-extras
  git-extra-commands
  gitfast
  github
  iterm2
  kubectl
  macports
  man
  macos
  npm
  python
  sudo
  vscode
  yarn
  zsh-better-npm-completion
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.aliases
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(starship init zsh)"
eval "$(pyenv init -)"
eval "$(fnm env --use-on-cd)"
