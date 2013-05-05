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
 Bundle 'skammer/vim-css-color'
 "loads sensinble.vim earlier, so i can override it (currently overriding:
 "<C-U> <G-U>u<C-U> with <CTR>  <G-U>u<C-U>
 Bundle 'chriskempson/base16-vim'
filetype plugin on
syntax on
runtime! plugin/sensible.vim
set textwidth=79
set colorcolumn=80
set background=dark
let base16colorspace=256
colorscheme base16-default
set shiftwidth=4
set softtabstop=4
set guioptions-=mT
set laststatus=0
set lazyredraw
set tabstop=4
set expandtab
set smarttab
set relativenumber
set foldmethod=indent
set foldlevel=99
set ignorecase
set smartcase
set mouse=a
set pastetoggle=<F3>
set whichwrap+=<,>,h,l
set modeline
set gdefault
set autowrite
set undodir^=~/.vim/undo
autocmd BufWritePost *.py call Flake8()
let g:clipbrdDefaultReg = '*'
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
nnoremap <C-J> :bp<CR>
nnoremap <C-K> :bn<CR>
"move up and down one screen line, not one text line.
nnoremap j gj
nnoremap k gk
inoremap jj <Esc>
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
"CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CR after inserting a line break. tpope sais it's
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
autocmd BufNewFile, BufRead *.txt setlocal spell spelllang=en
au FocusLost * :wa
"saves folds
autocmd BufWrite * mkview
autocmd BufRead * silent loadview
inoremap <esc> <right><esc>
