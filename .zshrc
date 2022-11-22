# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="true"

ZSH_DISABLE_COMPFIX=true

plugins=(
  aws
  aliases
  brew
  colored-man-pages
  common-aliases
  composer
  docker
  dotenv
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
  zsh-z
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.bash_profile
source ~/.aliases
source ~/.spaceship

source $(brew --prefix)/opt/spaceship/spaceship.zsh
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
