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
" Use <gcc> to comment out a line, <gc> to comment out the target of a motion
"(for example, <gcap> to comment out a paragraph), and <gc> in visual mode to
" comment out a region. The above maps actually toggle, and <gcu> uncomments a */
"set of adjacent commented lines.
 Bundle 'tpope/vim-commentary'
" omnicomplete with tab and a ton of option, look them up
 Bundle 'ervandew/supertab'
" lets you define constructs, snippets, to use in autocompletion.
 Bundle 'msanders/snipmate.vim'
" improved syntax higlighting for python
 Bundle 'python.vim'
" corrects syntax errors, styilistc incoherency to PEP8, and excessive
 "complexity. Call with <F7> Bundle 'nvie/vim-flake8'
 Bundle 'nvie/vim-flake8'
" <leader><leader><jump-term(f,t,w,b,e and n,N after a search)> labels with
"letters possible choices and you select one.
 Bundle 'Lokaltog/vim-easymotion'
"colortheme
 "loads sensinble.vim earlier, so i can override it (currently overriding:
 "<C-U> <G-U>u<C-U> with <CTR>  <G-U>u<C-U>
filetype plugin on
syntax on
runtime! plugin/sensible.vim
set textwidth=79
set colorcolumn=80
set background=dark
" wait to configure shell for this colorscheme base16-default
colorscheme desert
"This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set shiftwidth=4
"makes VIM see multiple space characters as tabstops, and so <BS> does the right thing and will delete four spaces
set softtabstop=4
"tabs are counted as 4 spaces
set guioptions-=mT
set tabstop=4
"tabs are converted to spaces
set expandtab
set smarttab
set relativenumber
set foldmethod=indent
" show line numbers
set foldlevel=99
"folds indented text
set ignorecase
"ignore case in search if all lowercase
set smartcase
set mouse=a
"press F3 to avoid strange pasting behavior.
set pastetoggle=<F3>
"j and l go down a line when at the end
set whichwrap+=<,>,h,l
"put a coomment a tthe end of every file indicating the format options to vim
set modeline
"s/word/ward/ substitues all in same line, s/word/ward/g only first instnce
set gdefault
"saves when you execute anouther command from the command line
set autowrite
"undo file stay in their goddamn place
set undodir^=~/.vim/undo
autocmd FileType markdown setlocal spell spelllang=en_us            "set english spelling for markdown files
autocmd FileType text setlocal spell spelllang=en_us      "set spelling for plaintext files, as defined by the the user-created                                                                              vim file /usr/share/vim/vimfiles/ftdetect/plaintext.vim
"launch Pyflake8 on the current file every time I save it
autocmd BufWritePost *.py call Flake8()
"launch
"Sets the vim default register to be the same as that of Xorg
let g:clipbrdDefaultReg = '*'
"now easy motion only needs <leader>f<word>
let g:EasyMotion_leader_key = '<Leader>'

let mapleader = ","
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
"no more esc !
inoremap jj <Esc>
" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
"CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CR after inserting a line break. tpope sais it's
" awesome
inoremap <CR> <C-G>u<C-U>
"turnoff vim default wierd handling of regex, by inserting a \v before any
"search
nnoremap / /\v
vnoremap / /\v
"selects the test you just pasted in visual mode
nnoremap <leader>v V`]
 "w!! in command mode saves changes made to protected files opened without sudo
command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"save when losing focus
au FocusLost * :wa
