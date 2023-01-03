#!/bin/bash

wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz -C /usr/local/share/nvim --strip-components=1
rm -rf ~/nvim-linux64.tar.gz
