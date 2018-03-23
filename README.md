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

# Custom Keybindings

Default `<leader>` is `\`

## Navigation

```
<leader>b      :Buffers<CR>               switch buffer             [fzf]
<leader>g      :Ggrep <C-R><C-W><CR>      git grep word             [grep]
<leader>t      :GitFiles<CR>              open file                 [fzf]
<leader>w      <ESC>:bw<CR>               close buffer
<A-h>          <C-w>h                     navigate splits
<A-j>          <C-w>j                     navigate splits
<A-k>          <C-w>k                     navigate splits
<A-l>          <C-w>l                     navigate splits
<C-n>          :bn<CR>                    next buffer
<C-p>          :bp<CR>                    prev buffer
<leader>n      :tabnext<CR>               next tab
<leader>p      :tabprev<CR>               prev tab
<leader>nt     :NERDTree                  open NERDTree             [nerdtree]
```

## Spell checker

```
<F8>           :setlocal spell spelllang=de_20,de,en<CR>:call WordProcessor(1)<CR>
<s-F8>         :setlocal spell spelllang=en<CR>:call WordProcessor(1)<CR>
<esc><F8>      :setlocal nospell<CR>:call WordProcessor(0)<CR>
```

## Misc

```
<F3>           :TestFile<CR>                                        [vim-test]
<F4>           :GoImports<CR>                                       [vim-go]
<F5>           pastetoggle (should not be necessary)
<F5>           :TagbarToggle<CR>                                    [tagbar]
<F6>           :command
_th            :source $VIMRUNTIME/syntax/2html.vim
_tt            :source $VIMRUNTIME/syntax/2tex.vim
_ta            :TOansi (visual only)
!ma            <ESC>:w<CR>:make<CR>
_rw            i<%= %>
```

# Plugins

* airblade/vim-rooter             - change working dir to project root
* benekastah/neomake              - asynchronously run programs, like rubocop
* davinche/godown-vim             - Markdown support
* fatih/vim-go                    - Go support
* junegunn/fzf                    - fuzzy find
* majutsushi/tagbar               - class outline viewer
* manno/file-line                 - allows to open file:line
* manno/grep                      - git grep support
* manno/vim-tags                  - ctags generator: `TagsGenerate!`
* nsf/gocode                      - autocompletion for Go
* roxma/nvim-completion-manager   - async keyword completion
* scrooloose/nerdtree             - file system explorer
* tpope/vim-surround              - is all about "surroundings": `ysiw'`
* vim-scripts/Align               - align text
* vim-scripts/SQLUtilitiesa       - format SQL
* vim-scripts/The-NERD-Commenter  - comment code
* vim-scripts/fugitive.vim        - Git support

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

## Language Support From Polyglot Plugin

* JulesWang/css.vim
* honza/dockerfile.vim
* mitsuhiko/vim-python-combined
* othree/html5.vim
* sheerun/yajs.vim
* stephpy/vim-yaml
* tpope/vim-git
* tpope/vim-haml
* tpope/vim-markdown
