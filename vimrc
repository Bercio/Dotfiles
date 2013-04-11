filetype off                                                   
"required for vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" vim +BundleInstall +qall|vim; :BundleInstall installs all,
" vim +BundleInstall! +qall | vim; :BundleInstall!  updates all
 Bundle 'gmarik/vundle'
 
" here be TIMPOPE !!!!!!!!!!!!!!!!!!!!!!!!
" Defaults everyone can agree on
 Bundle 'tpope/vim-sensible'
" the dot repeats commands from plugins too
 Bundle 'tpope/vim-repeat'
" Use <gcc> to comment out a line, <gc> to comment out the target of a motion (for example, <gcap> to comment out a paragraph), and <gc> in visual mode to comment out a region. The above maps actually toggle, and <gcu> uncomments a set of adjacent commented lines. 
 Bundle 'tpope/vim-commentary'
" omnicomplete with tab and a ton of option, look them up
 Bundle 'ervandew/supertab'
" lets you define constructs, snippets, to use in autocompletion. 
 Bundle 'msanders/snipmate.vim'
" improved syntax higlighting for python
 Bundle 'python.vim'
" corrects syntax errors, styilistc incoherency to PEP8, and excessive complexity. Call with <F7>
 Bundle 'nvie/vim-flake8'
" <leader><leader><jump-term(f,t,w,b,e and n,N after a search)> labels with letters possible choices and you select one.
 Bundle 'Lokaltog/vim-easymotion'
"colortheme
 Bundle 'chriskempson/base16-vim'
filetype plugin indent on             
syntax on 

set textwidth=79
set background=dark
colorscheme base16-default

set shiftwidth=4                                               "This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set softtabstop=4                                              "makes VIM see multiple space characters as tabstops, and so <BS> does the right thing and will delete four spaces
set tabstop=4                                                  "tabs are counted as 4 spaces
set expandtab                                                  "tabs are converted to spaces
set relativenumber                                                     " show line numbers
set foldmethod=indent                                          "folds indented text
set foldlevel=99
set ignorecase
set smartcase                                                  "ignore case in search if all lowercase
set formatoptions=c,q                                          "Auto-wrap comments using textwidth, insertingthe current comment leader                                                                           automatically. q allows formatting comments with gq
set encoding=utf-8                                             "encode everything in utf-8
set grepprg=grep\ -nH\ $*                                      " Set grep to always display the filename.
set mouse=a
set pastetoggle=<F3>                                           "press F3 to avoid strange pasting behavior.
set whichwrap+=<,>,h,l
autocmd FileType markdown setlocal spell spelllang=en_us            "set english spelling for markdown files
autocmd FileType plaintext setlocal spell spelllang=en_us      "set spelling for plaintext files, as defined by the the user-created                                                                              vim file /usr/share/vim/vimfiles/ftdetect/plaintext.vim
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
command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'
let mapleader = ","
