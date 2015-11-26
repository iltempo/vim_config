set nocompatible              " be iMproved

" Run shell commands via sh. Needed when using fish shell.
set shell=/bin/sh

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'wikitopian/hardmode'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'flazz/vim-colorschemes'
Bundle 'fatih/vim-go'
Bundle 'ngmy/vim-rubocop'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-colorscheme-switcher'
Bundle 'rizzatti/dash.vim'

" Writing bundles
Bundle 'reedes/vim-pencil'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"


