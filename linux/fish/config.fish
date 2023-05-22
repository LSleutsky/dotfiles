if status is-interactive
  source /home/lush/.aliases

  set ARCHFLAGS -arch x86_64
  set LANG en_US.UTF-8
  set LC_ALL en_US.UTF-8
  set LC_CTYPE en_US.UTF-8
  set SYSTEM_INIT systemd
  set GHQ_ROOT /home/lush/ghq
  set PAGER less
  set EDITOR lvim
  set XDG_CONFIG_HOME /home/lush/.config
  set XDG_CACHE_HOME /home/lush/.cache
  set XDG_DATA_HOME /home/lush/.local/share
  set XDG_STATE_HOME /home/lush/.local/state

  set PATH /home/lush/go/bin $PATH
  set PATH /home/lush/.cargo/bin $PATH

  starship init fish | source

  begin
    set --local AUTOJUMP_PATH /home/lush/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
      source $AUTOJUMP_PATH
    end
  end
end
