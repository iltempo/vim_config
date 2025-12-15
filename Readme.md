# Vim Configuration

My vim config makes use of [Vundle](https://github.com/gmarik/vundle) to manage plugins.

## Installation

    brew install neovim tmux
    brew install --cask font-jetbrains-mono ghostty
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    curl -Lo- http://bit.ly/vim_config | bash

## Updating

    cd ~/.vim && rake

## Python Support (pynvim with uv)

Install pynvim as a global tool:

    uv tool install pynvim

Add to your Neovim config:

```lua
-- init.lua
vim.g.python3_host_prog = vim.fn.expand("~/.local/share/uv/tools/pynvim/bin/python")
```

Verify with `:checkhealth provider`

