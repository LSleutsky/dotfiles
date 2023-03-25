[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

export ARCHFLAGS="-arch x86_64"
export EDITOR="lvim"
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ENABLE_CORRECTION="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  aliases
  archlinux
  autoupdate
  colored-man-pages
  common-aliases
  docker
  dotenv
  fast-syntax-highlighting
  gh
  git
  git-extras
  git-extra-commands
  gitfast
  github
  npm
  sudo
  vscode
  zsh-autosuggestions
  zsh-better-npm-completion
)

eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source /usr/share/nvm/init-nvm.sh

path+=(
    $(ruby -e 'puts File.join(Gem.user_dir, "bin")')
)
