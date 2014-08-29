" Why does it have to be an explicit path here?
source ~/.vim/bundles.vim

syntax enable
set background=dark
colorscheme jellybeans

set laststatus=1      " Hide status line
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\⇾\             " a tab should display as "⇾ "
set listchars+=trail:․            " show trailing spaces as dots
set listchars+=extends:→          " The character to show in the last column when wrap is
set listchars+=precedes:←         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

function! s:setupTextFormat()
  set wrap
  set linebreak
  set textwidth=88
  set nolist
  set formatoptions+=taw
  set spell spelllang=de,en
endfunction

" Set up line wrapping in text files
autocmd BufRead,BufNewFile *.{txt} :set filetype=text
autocmd BufRead,BufNewFile *.{md,markdown,mdown} :set filetype=markdown
autocmd FileType {text,markdown,mail,gitcommit} call s:setupTextFormat()
autocmd FileType {qf} set wrap

" Use git for file listing. That way git ignored files will not be shown.
let g:ctrlp_user_command = 'cd %s && git ls-files . --cached --exclude-standard --others'

" Use the silver searcher for grep
set grepprg=ag\ --nogroup\ --nocolor

" Command to turn hash rockets into new style Ruby hashes
command! -bar -range=% NotRocket :<line1>,<line2>s/:\(\w\+\)\s*=>/\1:/ge

" Allow vim fugitive :Gbrowse on XING GitHub Enterprise
let g:fugitive_github_domains = ['source.xing.com']

" Run rspec tests through vim
let g:rspec_command = "compiler rspec | Make rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" Hard mode settings
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
let g:HardMode_level = 'wannabe'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" Matchit is needed for vim-textobj-rubyblock
runtime macros/matchit.vim
