set nocompatible                                               " use pure vim settings, uncompatible with vi, must be set at the start of .vimrc 
filetype off                                                   "required for vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

                                       " let Vundle manage Vundle
                                       " required!
 Bundle 'gmarik/vundle'
 
                                       " My Bundles here:
                                       " ?
 Bundle 'pep8'
                                       " git wrapper
" Bundle 'tpope/vim-fugitive'
                                       " omnicomplete with tab
 Bundle 'ervandew/supertab'
                                       " easy acces to python documentation
 Bundle 'fs111/pydoc.vim'
             
                                       " colorscheme
 Bundle 'altercation/vim-colors-solarized'
filetype plugin indent on             " file type detection and language depending indenting
syntax on                                                      " set syntax highlighting on

set textwidth=79
set background=dark
colorscheme solarized
call togglebg#map("<F5>")

set nobackup
set shiftwidth=4                                               "This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set softtabstop=4                                              "makes VIM see multiple space characters as tabstops, and so <BS> does the right thing and will delete four spaces
set tabstop=4                                                  "tabs are counted as 4 spaces
set expandtab                                                  "tabs are converted to spaces
set number                                                     " show line numbers
set autoindent                                                 " the indent of the new line will match that of the previous line.
set foldmethod=indent                                          "folds indented text
set foldlevel=99
set history=50                                                 " keep 50 lines of command line history
set showcmd                                                    " display incomplete commands
set incsearch                                                  " do incremental searchin
set ignorecase
set smartcase                                                  "ignore case in search if all lowercase
set formatoptions=c,q                                          "Auto-wrap comments using textwidth, insertingthe current comment leader                                                                           automatically. q allows formatting comments with gq
set encoding=utf-8                                             "encode everything in utf-8
set wildmenu                                                   "show autocomplete menus
set grepprg=grep\ -nH\ $*                                      " Set grep to always display the filename.
set mouse=a
set pastetoggle=<F3>                                           "press F3 to avoid strange pasting behavior.

autocmd FileType tex setlocal spell spelllang=en_us            "set english spelling for tex files
autocmd FileType plaintext setlocal spell spelllang=en_us      "set spelling for plaintext files, as defined by the the user-created                                                                              vim file /usr/share/vim/vimfiles/ftdetect/plaintext.vim
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class "indent after those wordso

let g:SuperTabDefaultCompletionType = "context"                "python context-dependent autocompletion with SuperTab
let g:pep8_map                      = '<leader>8'                                     "browse Pep8 corrections with ,8
let g:tex_flavor                    = "latex"
"forces to be a pro
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"move up and down one screen line, not one text line.
nnoremap j gj
nnoremap k gk
 "w!! in command mode saves changes made to protected files opened without sudo
cmap w!! w !sudo tee % >/dev/null                             
"use normal regex in normal and visual mode
"nnoremap / /\v not working well    
"vnoremap / /\v not working well    
let mapleader = ","
