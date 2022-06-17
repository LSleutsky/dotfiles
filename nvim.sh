#!/bin/bash

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar -xzvf nvim-macos.tar.gz -C /usr/local/share/nvim --strip-components=1
