# Vim Configuration

My vim config makes use of [Vundle](https://github.com/gmarik/vundle) to manage plugins.

## Installation

    brew install neovim tmux fish
    curl -Lo- http://bit.ly/vim_config | bash

    chsh -s /usr/local/bin/fish

## Updating

    cd ~/.vim && rake

## Configuration for JavaScript development

    brew install node
    npm install standard --global
