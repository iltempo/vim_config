" Why does it have to be an explicit path here?
source ~/.vim/bundles.vim

syntax enable
set background=dark
colorscheme hybrid

set laststatus=1      " Hide status line
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs

" List chars
set nolist                        " Hide invisible characters, enable via :set list
set listchars=""                  " Reset the listchars
set listchars=tab:»·              " a tab should display as "»·"
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Enable preview mode in netrw using p key.
let g:netrw_preview = 1

" Don't show swap files in netrw.
let g:netrw_list_hide= '.swp$'

" Use system clipboard by default
set clipboard=unnamed

" Detect some specific file types correctly
autocmd BufRead,BufNewFile *.{txt} :set filetype=text
autocmd BufRead,BufNewFile *.{md,markdown,mdown} :set filetype=markdown

" Set up spell checking
autocmd FileType {text,markdown,mail,gitcommit} call s:setupSpell()

function! s:setupSpell()
  set spell spelllang=en_us,de_de
  set spell
endfunction

" Set MacVim font
set guifont=Fira\ Code:h18,Monaco:h17
if exists("&macligatures")
  set macligatures
endif

" Hide GUI toolbar
set guioptions-=T

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

" Some Syntastic display configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Syntastic checks and code formatting for JavaScript
let g:syntastic_javascript_checkers = ['standard']
" NOTE: This breaks displaying syntastic syntax checking and markers
"autocmd bufwritepost *.js silent !standard --fix %
"set autoread

" Matchit is needed for vim-textobj-rubyblock
runtime macros/matchit.vim

" Source local configuration if existing
if filereadable(expand("~/.vimrc.local"))
  source $HOME/.vimrc.local
endif

" Rust Programming Language
let g:rustfmt_autosave=1
