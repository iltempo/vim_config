:set filetype=vim

" Why does it have to be an explicit path here?
source ~/.vim/bundles.vim

syntax enable
filetype plugin on
filetype on

colorscheme antares

" Enable Goyo by default in markdown files
"autocmd FileType markdown Goyo

" Start Limelight with Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  Limelight
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

let g:limelight_conceal_ctermfg = 'gray'

let b:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['jslint']}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_ruby_rubocop_options = '--auto-correct'

highlight ExtraWhitespace ctermbg=white guibg=white
match ExtraWhitespace /\s\+$/

" Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

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
autocmd BufRead,BufNewFile .vimrc set filetype=vim
autocmd BufRead,BufNewFile *.{txt} :set filetype=text
autocmd BufRead,BufNewFile *.{md,markdown,mdown} :set filetype=markdown
autocmd BufRead,BufNewFile *.{rb,erb} :set filetype=ruby
autocmd BufRead,BufNewFile *.{haml} :set filetype=haml
autocmd BufRead,BufNewFile *.{js,jsx} :set filetype=javascript
autocmd BufNewFile,BufRead [Tt]odo.txt set filetype=todo
autocmd BufNewFile,BufRead *.[Tt]odo.txt set filetype=todo
autocmd BufNewFile,BufRead [Dd]one.txt set filetype=todo
autocmd BufNewFile,BufRead *.[Dd]one.txt set filetype=todo

" Set up spell checking
autocmd FileType {text,markdown,mail,gitcommit} call s:setupSpell()

function! s:setupSpell()
  set spell spelllang=en_us,de_de
  set spell
endfunction

" Use git for file listing. That way git ignored files will not be shown.
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" Invoke buffer listing with CTRL+L
nnoremap <C-l> :CtrlPBuffer<cr>

" Use the silver searcher for grep
set grepprg=ag\ --nogroup\ --nocolor

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

" Prevent markdown folding
let g:vim_markdown_folding_disabled = 1

" Source local configuration if existing
if filereadable(expand("~/.vimrc.local"))
  source $HOME/.vimrc.local
endif
