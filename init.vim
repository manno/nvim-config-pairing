" ----- Colors
set mouse=ivh

"----- Setup tabs, use spaces instead of tabs
set shiftround
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cf                " Enable error files & error jumping.
set autowrite         " Writes on make/shell commands

"----- speed
set synmaxcol=512
"set lazyredraw        " to avoid scrolling problems

"----- Setup document specifics
filetype on                       " Enable filetype detection
set hidden                        " Allow hidden buffers
set noinsertmode                  " Don't don't out in insert mode
set backspace=indent,eol,start    " Allow us to backspace before an insert
set wildignore+=*.o,*.obj,.svn,.git,tags

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal g'\"" | endif

"----- Backups & Files
set backup                  " Enable creation of backup file.
if empty(glob('~/.local/share/nvim/backup'))
    call mkdir($HOME . "/.local/share/nvim/backup", "p", 0700)
endif
set backupdir=~/.local/share/nvim/backup " Where backups will go.
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload

augroup NoSimultaneousEdits
    autocmd!
    autocmd  SwapExists  *  :let v:swapchoice = 'o'
augroup END

"----- Search
set ignorecase
set smartcase

"----- Encoding
set nodigraph               " Disable digraphs for uumlauts
set fileencodings=utf-8,iso-8859-15,ucs-bom    " heuristic
set virtualedit=block  " Fix problem with yank in utf8

"----- Diffmode
if &diff
    syntax off
    "set wrap
    set diffopt+=iwhite
endif

"----- Statusline
set ruler
set showcmd                 " show the command in the status line

" ----- Spelling
"
" Rechtschreibung & Word Processing: move cursor in editor lines, not text lines
" change to utf8 umlaut compatible mode with digraphs
" http://vim.wikia.com/wiki/VimTip38
function WordProcessor(enable)
  if a:enable
    echo "WordProcessor Mode: enabled"
    imap <Up> <C-O>gk
    imap <Down> <C-O>gj
  else
    echo "WordProcessor Mode: disabled"
    silent! iunmap <Up>
    silent! iunmap <Down>
  endif
endfunction

" German spelling
map <F8>        :setlocal spell spelllang=de_20,de,en<CR>:call WordProcessor(1)<CR>
map <s-F8>      :setlocal spell spelllang=en<CR>:call WordProcessor(1)<CR>
map <esc><F8>   :setlocal nospell<CR>:call WordProcessor(0)<CR>

set thesaurus+=~/.config/nvim/spell/thesaurus.txt

" ----- Keys / Mappings / Commands
"
" Change map leader, default is \
"let mapleader = ","

" Famous paste toggle for xterm vim
set pastetoggle=<F5>

" Buffer next/prev
nnoremap <C-n>   :bn<CR>
nnoremap <C-p>   :bp<CR>

" Quit all buffers - qa/wa
command! Q      :quitall

" Close current buffer
map <leader>w       <ESC>:bw<CR>

" Debug
map   <F6>      :command

" Make
map !ma       <ESC>:w<CR>:make<CR>

" Since ctrl-t is bound to commandt / unite / fzf
let @t = ":pop"

" Search
map <leader>g     :Ggrep <C-R><C-W><CR>

" ----- Mousewheel in Xterm
"
" map <M-Esc>[62~ <MouseDown>
" map! <M-Esc>[62~ <MouseDown>
" map <M-Esc>[63~ <MouseUp>
" map! <M-Esc>[63~ <MouseUp>
" map <M-Esc>[64~ <S-MouseDown>
" map! <M-Esc>[64~ <S-MouseDown>
" map <M-Esc>[65~ <S-MouseUp>
" map! <M-Esc>[65~ <S-MouseUp>

" Forgot to open as root?
command! Wsudo  :w !sudo tee > /dev/null %

command! Tidy :%!/opt/tidy-html5/bin/tidy -w -i -q -f /dev/null

" Format json
com! -range FormatJSON <line1>,<line2>!python -m json.tool

" ----- Converter Mappings
"
" Convert to html
map  _th     :source $VIMRUNTIME/syntax/2html.vim
" convert to colored tex, use TMiniBufExplorer first
map  _tt     :source $VIMRUNTIME/syntax/2tex.vim
" convert to colored ansi
vmap _ta     :TOansi

" ----- Plug
" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  " FIXME python setup? pip install python-neovim
endif
call plug#begin('~/.config/nvim/plugged')

" Nerd
Plug 'The-NERD-Commenter'

" Grep
"Plug 'vim-scripts/grep.vim'
Plug 'manno/grep'

" Search with ag?
"Plug 'rking/ag.vim'

" Status line
Plug 'vim-airline'

" Open files
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'Shougo/neocomplete.vim'
"Plug 'Shougo/neocomplcache.vim'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Syntax errors
"Plug 'scrooloose/syntastic'
Plug 'benekastah/neomake'

" Colorschemes
Plug 'jonathanfilip/vim-lucius'
"Plug 'tomasr/molokai'
"Plug 'noahfrederick/vim-hemisu'
Plug 'endel/vim-github-colorscheme'
"Plug 'chriskempson/vim-tomorrow-theme'

" Ctags support
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'

" Tmux integration
Plug 'edkolev/tmuxline.vim'

" Format SQL
Plug 'vim-scripts/SQLUtilities'
Plug 'vim-scripts/Align'

" Surround - yse' veS'
Plug 'tpope/vim-surround'

" Vim ruby
" gem install gem-ctags
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'janko-m/vim-test'

" Open files at line
Plug 'manno/file-line'

" Gvim related - change project root
Plug 'airblade/vim-rooter'

" Polyglot bundles csv.vim and an old version too
" Instead install separately https://github.com/sheerun/vim-polyglot
" Plug 'vim-polyglot'
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'sheerun/yajs.vim', { 'for': 'javascript' }
Plug 'honza/dockerfile.vim', { 'for': 'docker' }
Plug 'JulesWang/css.vim', { 'for': 'css' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mitsuhiko/vim-python-combined', { 'for': 'python' }
Plug 'vim-scripts/R.vim', { 'for': 'r' }

" Git
Plug 'fugitive.vim'

" Latexsuite = vim-latex
Plug 'vim-latex/vim-latex', { 'for': 'tex' }

call plug#end()

" ----- Plugin Configurations
"

" fzf
map <C-t> :GitFiles<CR>
map <leader>t :GitFiles<CR>
map <leader>b :Buffers<CR>

" vim-test
nmap <F3> :TestFile<CR>
let test#strategy = "neovim"

" tagbar
nmap <F5> :TagbarToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" fugitive git grep
autocmd QuickFixCmdPost *grep* cwindow

" airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline_theme='lucius'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux.airline.conf"

" don't show quickfix in buffer list
augroup QFix
    autocmd!
    autocmd FileType qf setlocal nobuflisted
augroup END

" Vim Rooter
let g:rooter_patterns = [ 'package.json', 'README.md', 'Rakefile', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/' ]

" ----- Filetype Specific Settings
"
"autocmd FileType csv          set nofoldenable
"autocmd FileType xml          let g:xml_syntax_folding = 1
autocmd FileType c            set omnifunc=ccomplete#Complete ts=2 sw=2 cindent
autocmd FileType css          set omnifunc=csscomplete#CompleteCSS
autocmd FileType eruby        map _rw i<%= %>
autocmd FileType eruby        set ts=2 sw=2 number
autocmd FileType go           map <F4> :GoImports<CR>
autocmd FileType go           setlocal noet ts=8 sw=8 sts=8 number
autocmd FileType html         set omnifunc=htmlcomplete#CompleteTags
autocmd FileType java         set foldmethod=manual
autocmd FileType javascript   set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType lua          set ts=4 sw=4 et smartindent foldmethod=syntax
autocmd FileType nfo          edit ++enc=cp437
autocmd FileType perl         source $HOME/.config/nvim/config/filetype_perl.vim
autocmd FileType php          set omnifunc=phpcomplete#CompletePHP
autocmd FileType plaintex     source $HOME/.config/nvim/config/filetype_tex.vim
autocmd FileType python       set omnifunc=pythoncomplete#Complete
autocmd FileType ruby         source $HOME/.config/nvim/config/filetype_ruby.vim
autocmd FileType ruby,eruby   let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby   let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby   let g:rubycomplete_rails = 1
autocmd FileType vim          set ts=4 sw=4
autocmd FileType xml          set omnifunc=xmlcomplete#CompleteTags ts=4 sw=4
autocmd FileType xwt          set ts=2 sw=2 foldmethod=syntax
autocmd FileType zsh          set ts=4 sw=4 et

" strip trailing whitespace
autocmd FileType vim,ruby,yaml,haml,css,html,eruby,coffee,javascript,markdown,sh autocmd BufWritePre <buffer> :%s/\s\+$//e

" ----- Colorschemes
colorscheme github

" ----- NERDCommenter
let NERDSpaceDelims = 1

" ----- Terminal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
