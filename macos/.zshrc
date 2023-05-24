[ -s /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm ] && \. /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm

# This loads autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Load RVM into a shell session *as a function*
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
  zsh-autosuggestions
  zsh-better-npm-completion
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.bash_profile
source ~/.aliases

eval "$(pyenv init -)"
eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

fpath+=${ZDOTDIR:-~}/.zsh_functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fnm env --use-on-cd)"
