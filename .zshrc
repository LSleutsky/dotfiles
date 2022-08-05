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
ZSH_THEME="spaceship"

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
  zsh-z
  yarn
)

source ~/.oh-my-zsh/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/vscode/vscode.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.bash_profile
source ~/.aliases
source ~/.spaceship


fpath+=${ZDOTDIR:-~}/.zsh_functions
