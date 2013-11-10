set nocompatible              " be iMproved

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
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdcommenter'

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

" Run shell commands via sh. Needed when using fish shell.
set shell=/bin/sh

syntax enable
set background=dark
colorscheme solarized

" Hide status line most of the time
set laststatus=1

" Use git for file listing. That way git ignored files will not be shown.
let g:ctrlp_user_command = 'cd %s && git ls-files . --cached --exclude-standard --others'

" Use the silver searcher for grep
set grepprg=ag\ --nogroup\ --nocolor

" Command to turn hash rockets into new style Ruby hashes
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

" Run rspec tests through vim
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
