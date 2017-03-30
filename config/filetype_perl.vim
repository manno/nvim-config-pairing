"-----------------------------------------------------------
compiler perl
set ts=4 sw=4 sts=4 et
set foldmethod=syntax
set omnifunc=perlcomplete#CompleteTags
"set foldlevel=1
let perl_include_pod=1
let perl_fold=1

"-----------------------------------------------------------
" PERL MACROS 
"
""set perl_fold=1

"@m      perl class member method 
let @m = "vec=head2 \<ESC>po\<CR>\<CR>=cut \<ESC>osub  \<ESC>PA{\<CR>my $self=shift;\<ESC>"
"@n      perl method method 
let @n = "vec=head3  \<ESC>po\<CR>\<CR>=cut \<ESC>osub  \<ESC>PA{\<CR>\<ESC>"
"@g     perl getwidget
"let @g = "vecmy $\<ESC>pA = $glade->get_widget('\<ESC>pA');\<ESC>"
let @g = "vec$widget->{\<ESC>pA} = $glade->get_widget('\<ESC>pA');\<ESC>"
"@w     perl Template.pm Tags
" let @w = "i[% \<ESC>lwi %]\<ESC>"
"@k     klammer
let @k = "i(\<ESC>lwi)\<ESC>"
let @b = "i{\<ESC>lwi}\<ESC>"

" PERL MAPS
" quick insert - simple perl header
map  _p         :1<CR>O#!/usr/bin/perl<ESC>o# Description: FIXME<ESC>o# Usage: <ESC><CR>O<ESC>

" Look up docs function under cusor with _f:
nnoremap <buffer> <silent> _f :!perldoc -f <cword><Enter>
" Look up docs for module under cusor with _m:
nnoremap <buffer> <silent> _m :!perldoc <cword><Enter>
" Show as POD
nnoremap <buffer> <silent> _p :!perldoc %<Enter>
" Tidy selected lines (or entire file) with _t:
nnoremap <buffer> <silent> _t :%!perltidy -q<Enter>
vnoremap <buffer> <silent> _t :!perltidy -q<Enter>
