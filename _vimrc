set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set guifont=Consolas:h9:cRUSSIAN
set guioptions=mi
winsize 120 40

set textwidth=0
set cinoptions=4
set tabstop=4
set showmatch
set showcmd
set ruler
set nu!
set ttyfast
set ai ek ru sc wmnu noeb nosol
set ls=2
set autowrite
set sidescroll=6
set listchars+=precedes:$,extends:$

cab E e
cab W w
cab R r
cab Ver ver
cab Set set
cab Ta ta
cab Grep grep
cab Make make
cab Cd cd

set viminfo=%,/500,'500,\"1000,:1000,n~/_viminfo
set statusline=%<%1*==\ %5*%f%1*%(\ ==\ %4*%h%1*%)%(\ ==\ %4*%m%1*%)%(\ ==\ %4*%r%1*%)\ ==%===\ %2*%b(0x%B)%1*\ ==\ %3*%l,%c%V%1*\ ==\ %5*%P%1*\ ==%0* laststatus=2
set bs=2
set ttyfast

map <F4> :set tabstop=4<CR>
map <F8> :set tabstop=8<CR>
map <F6> :set wrap!<CR>

set history=10000
set display=lastline

syn on

set expandtab
set softtabstop=4
set tabstop=8

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set background=light

" Highlight redundant whitespaces and tabs.
highlight RedundantSpaces ctermbg=lightred guibg=lightred
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

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

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set nobackup
set nowritebackup
set undodir=~/.vim

