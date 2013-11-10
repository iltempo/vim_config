" Why does it have to be an explicit path here?
source ~/.vim/bundles.vim

syntax enable
set background=dark
colorscheme solarized

" Hide status line most of the time
set laststatus=1

" Do autocompletion on tab
imap <Tab> <C-P>

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
