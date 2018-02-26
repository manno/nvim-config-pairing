# Description

This config

* disables mouse mostly
* avoids writing tabs
* allows multiple unsaved buffers
* enables backups and a 1000 undo levels
* jumps to last position in a previously opened file
* removes whitespace at the end of a line on save

# Custom Commands

* `:Q` - quitall
* `:Wsudo` - sudo and write file
* `:Tidy` - try to run tidy for HTML

# Additional Keys

Default `<leader>` is `\`

## Navigation

```
<leader>b      :Buffers<CR>
<leader>g      :Ggrep <C-R><C-W><CR>
<leader>t      :GitFiles<CR>
<leader>w      <ESC>:bw<CR>
<A-h>          <C-w>h
<A-j>          <C-w>j
<A-k>          <C-w>k
<A-l>          <C-w>l
<C-n>          :bn<CR>
<C-p>          :bp<CR>
<leader>n      :tabnext<CR>
<leader>p      :tabprev<CR>
<leader>nt     :NERDTree
```

## Terminal

```
<A-h>          <C-\><C-n><C-w>h
<A-j>          <C-\><C-n><C-w>j
<A-k>          <C-\><C-n><C-w>k
<A-l>          <C-\><C-n><C-w>l
```

## Spell checker

```
<F8>           :setlocal spell spelllang=de_20,de,en<CR>:call WordProcessor(1)<CR>
<s-F8>         :setlocal spell spelllang=en<CR>:call WordProcessor(1)<CR>
<esc><F8>      :setlocal nospell<CR>:call WordProcessor(0)<CR>
```

## Misc

```
<F3>           :TestFile<CR>
<F4>           :GoImports<CR>
<F5>           pastetoggle (should not be necessary)
<F5>           :TagbarToggle<CR>
<F6>           :command
_th            :source $VIMRUNTIME/syntax/2html.vim
_tt            :source $VIMRUNTIME/syntax/2tex.vim
_ta            :TOansi (visual only)
!ma            <ESC>:w<CR>:make<CR>
_rw            i<%= %>
```

# Plugins

* airblade/vim-rooter
* benekastah/neomake
* fatih/vim-go
* junegunn/fzf
* majutsushi/tagbar
* manno/file-line
* manno/grep
* manno/vim-tags
* nsf/gocode
* roxma/nvim-completion-manager
* scrooloose/nerdtree
* tpope/vim-surround
* vim-scripts/Align
* vim-scripts/SQLUtilities
* vim-scripts/The-NERD-Commenter
* vim-scripts/fugitive.vim

## Appearance and Colorschemes

* edkolev/tmuxline.vim
* endel/vim-github-colorscheme
* jonathanfilip/vim-lucius
* vim-scripts/vim-airline
* iCyMind/NeoSolarized

## Ruby

* janko-m/vim-test
* tpope/vim-bundler
* tpope/vim-rails
* tpope/vim-rake

## From Polyglot Plugin

* JulesWang/css.vim
* honza/dockerfile.vim
* mitsuhiko/vim-python-combined
* othree/html5.vim
* sheerun/yajs.vim
* stephpy/vim-yaml
* tpope/vim-git
* tpope/vim-haml
* tpope/vim-markdown
