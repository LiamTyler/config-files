set nocompatible              " be iMproved, required
filetype off                  " required

set nobackup
set noswapfile
set noundofile

" Install the vim-plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'tikhomirov/vim-glsl'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" :Rg uses ripgrep search
Plug 'jremmen/vim-ripgrep'

" Can open items from quickfix list in tabs/splits, etc
Plug 'yssl/QFEnter'

" Initialize plugin system
call plug#end()

" QFEnter key bindings
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" Key bindings for FZF and RG
nnoremap <C-S-O> :FZF<CR>
nnoremap <C-F> :Rg<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
nnoremap <F2> :Vexplore<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent 
set cindent

filetype on
filetype plugin indent on
syntax on

autocmd FileType cpp,c source ~/.vim/syntax/vulkan1.0.vim

" Move cursor to same spot that it was when the file was closed
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remap tab next/previous
nnoremap <C-H> :tabprevious<CR>
nnoremap <C-L> :tabnext<CR>

nnoremap <C-N> :resize +10<CR>
nnoremap <C-M> :resize -10<CR>
