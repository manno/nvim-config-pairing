" --- Filetype detection
"
" ----- Don't execute this file
if exists("did_load_filetypes")
    finish
endif

" ----- Assign syntax by filename
" au = autocommand, au! remove all commands for group
"
augroup filetypedetect
    au BufNewFile,BufRead *.md            setf markdown
    au BufNewFile,BufRead *.mirah         setf ruby
    au BufNewFile,BufRead *.tt            setf html
    au BufNewFile,BufRead *.wiki          setf Wikipedia
    au BufNewFile,BufRead svn-commit.*    setf svn
    au BufNewFile,BufRead svn-log.*       setf svn
    au BufRead,BufNewFile *.prolog        setf prolog
    au BufRead *.coffee                  setf coffee
    au BufRead *.erb                     setf eruby
    au BufRead *.es6                     setf javascript
    au BufRead *.go                      setf go
    au BufRead *.jbuilder                setf ruby
    au BufRead *.prawn                   setf ruby
    au BufRead *.rhtml                   setf eruby
    au BufRead *.xwt                     setf xml
    au BufRead PKGBUILD                  setf sh
    au BufRead,BufNewFile *.nfo          setf nfo
    au BufRead,BufNewFile *.pdf          setf pdf
    au BufRead,BufNewFile *.txt          setf text
    au BufWritePost *.go                 Neomake
    au BufWritePost *.js                 Neomake
    au BufWritePost *.go                 GoImports
augroup END
