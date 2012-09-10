" :set guifont=DejaVu\ Sans\ Mono\ Book\ 11
" :set guifont=Droid\ Sans\ Mono\ 10
" :set guifont=Anonymous\ Pro\ 12
" :set guifont=Monospace\ 11
" :set guifont=Andale\ Mono\ 11
" :set guifont=Menlo\ Regular:h11
" :set guifont=Monico:h11
:set guifont=Bitstream\ Vera\ Sans\ Mono:h11
:set lines=55
:set columns=127
:set transparency=2

" Power mgmt savings -- turn off blinking cursor
let &guicursor = &guicursor . ",a:blinkon0"

" Use the clipboard
set clipboard+=unnamed " Yanks go on clipboard instead.

" Do not display Toolbar or menus
" :set go-=T
" :set go-=m
