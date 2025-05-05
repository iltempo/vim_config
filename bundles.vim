set nocompatible              " be iMproved
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" UI plugins
Plugin 'xolox/vim-misc'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'vim-airline/vim-airline'

" File navigation plugins
Plugin 'tpope/vim-vinegar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'

" Text editing plugins
Plugin 'freitass/todo.txt-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'ervandew/supertab'

" Coding plugins
Plugin 'scrooloose/nerdcommenter'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-haml'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-test/vim-test'

" AI plugins
"Plugin 'github/copilot.vim'
Plugin 'Exafunction/windsurf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
