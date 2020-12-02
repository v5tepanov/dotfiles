set background=dark

set ai ek ru sc wmnu noeb nosol
set autowrite
set cinoptions=4
set display=lastline
set history=2000
set listchars+=precedes:$,extends:$
set ls=2
set ruler
set showcmd
set sidescroll=6
set tabstop=8
set textwidth=0
set ttyfast

syntax on

set viminfo=%,/500,'500,\"1000,:1000,n~/.viminfo
set statusline=%<%1*==\ %5*%f%1*%(\ ==\ %4*%h%1*%)%(\ ==\ %4*%m%1*%)%(\ ==\ %4*%r%1*%)\ ==%===\ %2*%b(0x%B)%1*\ ==\ %3*%l,%c%V%1*\ ==\ %5*%P%1*\ ==%0* laststatus=2
set bs=2

map <F4> :set tabstop=4<CR>
map <F8> :set tabstop=8<CR>
map <F6> :set wrap!<CR>

" Restore cursor to file position in previous editing session
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=red guibg=red
"match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
match RedundantSpaces /\s\+$/

" function to cleanup a text -> mapped to F5
fun CleanText()
        let curcol = col(".")
        let curline = line(".")
        exe ":retab"
        exe ":%s/^M$//ge"
        exe ":%s/^M/ /ge"
        exe ":%s/ \\+$//e"
        call cursor(curline, curcol)
endfun
map <F5> :call CleanText()<CR>

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv
