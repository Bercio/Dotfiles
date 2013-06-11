"Pluggins
filetype off
"required for vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" vim +BundleInstall +qall|vim; :BundleInstall installs all,
" vim +BundleInstall! +qall | vim; :BundleInstall!  updates all
Bundle 'ivanov/vim-ipython'
Bundle 'gmarik/vundle'
Bundle 'sjl/gundo.vim'
Bundle 'mhinz/vim-startify'
Bundle 'vim-indent-object'
Bundle 'Valloric/YouCompleteMe'
Bundle 'fs111/pydoc.vim'
" here be TIMPOPE !!!!!!!!!!!!!!!!!!!!!!!!
Bundle 'tpope/vim-markdown'
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
"Change default behavior
syntax on
runtime! plugin/sensible.vim
set background=dark
let base16colorspace=256
colorscheme base16-default
set shiftwidth=4
set softtabstop=4
set whichwrap+=<,>,h,l
set scrolloff=10
set colorcolumn=80
set cursorline
set foldlevel=99
set laststatus=0
set modeline
set lazyredraw
set tabstop=4
set expandtab
set smarttab
set ignorecase
set smartcase
set pastetoggle=<F3>
set clipboard=unnamed
set gdefault
set matchpairs+=<:>
set shell=/bin/zsh
set makeprg="./%"
set hidden
set autowriteall
set autowrite
set undodir^=~/.vim/undo
autocmd FocusLost * writeall
"saves folds
autocmd BufWrite * mkview
autocmd BufRead * silent loadview
iabbrev lber Lorenzo Bercelli
iabbrev gml lorenzo233@gmail.com
"Filetype dependant
autocmd FileType python set foldmethod=indent
autocmd FileType python set makeprg="python %"
autocmd FileType sh set makeprg="sh %"
"Change default keybindings
"forces to be a pro
"move up and down one screen line, not one text line.
nnoremap j gj
nnoremap k gk
"space let's you enter a single char and go back to normal mode
nnoremap <Space> i_<Esc>r
inoremap jj <right><Esc>
nnoremap <C-x> lxh
nnoremap <leader>: w<CR>:
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>
nnoremap <c-s> i<CR><Esc>
nnoremap ! 1
nnoremap @ 2
nnoremap # 3
nnoremap $ 4
nnoremap % 5
nnoremap ^ 6
nnoremap & 7
nnoremap * 8
nnoremap ( 9
nnoremap ) 0
nnoremap 1 !
nnoremap 2 @
nnoremap 3 #
nnoremap 4 $
nnoremap 5 %
nnoremap 6 ^
nnoremap 7 &
nnoremap 8 *
nnoremap 9 (
nnoremap 0 )
nnoremap zh zt
nnoremap zl zb
nnoremap zm zz
nnoremap / /\v
vnoremap / /\v
"Reselct visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
"selects the test you just pasted in visual mode
nnoremap <leader>v V`]
let mapleader = ","
"Snippets config
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

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
"New commands
 "w!! in command mode saves changes made to protected files opened without sudo
command W silent execute 'write !sudo tee ' . shellescape(@%, 1) . ' >/dev/null'
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

function! AutoChmod()
    if getline(1) =~ "^#!.*/bin/"
        silent !chmod a+x <afile>
    endif
endfunction
autocmd BufWritePost * call AutoChmod()

command Ita setlocal spelllang=it keymap=italianaccents
"plugins keybindings
let g:EasyMotion_leader_key = '<leader>'
nnoremap <leader>K +YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-k>"
