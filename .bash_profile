eval "$(pyenv init -)"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DATA_DIRS="/usr/local/share"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share"

export EDITOR="nvim"

export PATH=$PATH:/opt/gradle/gradle-7.0/bin
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:/opt/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/opt
export PATH=$PATH:/usr/local/opt/openjdk/bin
export PATH=$PATH:/usr/local/opt/ruby/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/share
export PATH=$PATH:/usr/local/share/nvim/bin

export PATH=$PATH:$HOME/.pyenv
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:$HOME/.config/yarn/global/node_modules
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:$HOME/.rvm/gems/ruby-3.0.0/bin
# Add rvm to PATH and make sure this is the last PATH variable.
export PATH=$PATH:$HOME/.rvm/bin

# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

source ~/.aliases

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"