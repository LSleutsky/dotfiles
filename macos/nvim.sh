#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar -xzvf nvim-macos.tar.gz -C /usr/local/share/nvim --strip-components=1
rm -rf ~/nvim-macos.tar.gz
