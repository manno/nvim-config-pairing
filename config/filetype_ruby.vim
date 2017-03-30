"-----------------------------------------------------------
set foldmethod=manual
set ts=2 sw=2
"-----------------------------------------------------------
" RUBY MACROS 
"
"@c      ruby class
let @c = "vecclass \<ESC>po\<CR>def initialize\<CR>end\<CR>end\<CR>\<ESC>"

" Ruby MAPS
" Quick insert - simple ruby header
map  _r         :1<CR>O#!/usr/bin/ruby<ESC>o# Description: FIXME<ESC>o# Usage: <ESC><CR>O<ESC>

map  <F4>         :!rubocop -a %<CR>

map  _hr        :s/:\([a-z_]*\) =>/\1:/g<CR>

map  _hr2       :%s/:\([^":]*\) =>/\1:/g<CR>

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<byebug\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

set number

let g:neomake_ruby_rubocop_maker = {
            \ 'args': ['-D', '-R', '--format', 'emacs', '--fail-level', 'F'],
        \ 'errorformat': '%f:%l:%c: %t: %m',
        \ 'postprocess': function('neomake#makers#ft#ruby#RubocopEntryProcess')
        \ }
let g:neomake_ruby_enabled_makers = ['rubocop']

autocmd! BufWritePost * Neomake
