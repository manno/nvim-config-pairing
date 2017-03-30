" --- Filetype detection
"
" ----- Specific Settings
"
autocmd FileType c        set ts=2 sw=2 cindent
autocmd FileType c        set omnifunc=ccomplete#Complete
autocmd FileType css      set omnifunc=csscomplete#CompleteCSS
autocmd FileType eruby    set ts=2 sw=2
autocmd FileType eruby    map _rw i<%= %>
autocmd FileType go       setlocal noet ts=8 sw=8 sts=8
autocmd FileType go       map <F4> :GoImports<CR>
autocmd FileType html     set omnifunc=htmlcomplete#CompleteTags
autocmd FileType java     set foldmethod=manual
"autocmd FileType csv      set nofoldenable
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType lua      set ts=4 sw=4 et smartindent foldmethod=syntax
autocmd FileType nfo      edit ++enc=cp437 
autocmd FileType perl     source $HOME/.config/nvim/config/filetype_perl.vim 
autocmd FileType php      set omnifunc=phpcomplete#CompletePHP
autocmd FileType plaintex source $HOME/.config/nvim/config/filetype_tex.vim 
autocmd FileType python   set omnifunc=pythoncomplete#Complete
autocmd FileType ruby     source $HOME/.config/nvim/config/filetype_ruby.vim 
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType xml      set omnifunc=xmlcomplete#CompleteTags ts=4 sw=4
autocmd FileType xwt      set ts=2 sw=2 foldmethod=syntax 
autocmd FileType vim      set ts=4 sw=4
autocmd FileType zsh      set ts=4 sw=4 et
"autocmd FileType xml      let g:xml_syntax_folding = 1 

" strip trailing whitespace
autocmd FileType ruby,yaml,haml,css,html,eruby,coffee,javascript,markdown,sh autocmd BufWritePre <buffer> :%s/\s\+$//e

" ----- Don't execute next part twice
if exists("did_load_filetypes")
    finish
endif

" ----- Assign syntax by filename
" au = autocommand, au! remove all commands for group
"
augroup filetypedetect
    " -----  Text, for vimspell
    au! BufRead,BufNewFile *.txt      setf text
    " -----  PDF 
    au! BufRead,BufNewFile *.pdf      setf pdf
    " -----  MediaWiki
    au BufNewFile,BufRead *.wiki      setf Wikipedia
    " -----  Markdown
    au BufNewFile,BufRead *.md        setf markdown
    " -----  Prolog
    au BufRead,BufNewFile *.prolog    setf prolog
    " -----  SVN
    au BufNewFile,BufRead  svn-log.*  setf svn
    au BufNewFile,BufRead  svn-commit.* setf svn
    " -----  NFO
    au! BufRead,BufNewFile *.nfo      setf nfo
    " -----  eruby/rails/erb
    au! BufRead *.rhtml               setf eruby
    au! BufRead *.es6                 setf javascript
    au! BufRead *.erb                 setf eruby
    au! BufRead *.jbuilder            setf ruby
    au! BufRead *.coffee              setf coffee
    au! BufRead *.prawn               setf ruby
    " -----  perl templates
    au BufNewFile,BufRead  *.tt       setf html
    "  ----  mirah
    au BufNewFile,BufRead  *.mirah    setf ruby
    au! BufRead *.xwt                 setf xml
    au! BufRead *.go                  setf go
    au! BufWritePost *.go             Neomake
    au! BufWritePost *.js             Neomake
    au! BufRead PKGBUILD              setf sh
augroup END
