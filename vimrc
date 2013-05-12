"Pluggins
filetype off
"required for vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" vim +BundleInstall +qall|vim; :BundleInstall installs all,
" vim +BundleInstall! +qall | vim; :BundleInstall!  updates all
Bundle 'gmarik/vundle'
Bundle 'sjl/gundo.vim'
Bundle 'vim-indent-object'
Bundle 'Valloric/YouCompleteMe'
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
" lets you define constructs, snippets, to use in autocompletion.
Bundle 'SirVer/ultisnips'
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
set shell=/bin/zsh
set clipboard=unnamed
let g:clipbrdDefaultReg = '*'
let g:EasyMotion_leader_key = 'j:'
let g:EasyMotion_keys = '1234567890'
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
"let ycm and ultisnips coexist peacefully
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
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
inoremap jj <right><Esc>
nnoremap <leader>: w<CR>:
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
nnoremap <leader>k :split +YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap / /\v
vnoremap / /\v
"Reselct visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
"selects the test you just pasted in visual mode
nnoremap <leader>v V`]
 "w!! in command mode saves changes made to protected files opened without sudo
command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
autocmd BufNewFile, BufRead *.txt setlocal spell spelllang=en
"saves folds
autocmd BufWrite * mkview
autocmd BufRead * silent loadview
