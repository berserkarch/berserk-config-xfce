" ── Bootstrap ────────────────────────────────────────────
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Auto-install plugins on first launch
let s:plug_dir = expand('~/.vim/plugged')
if len(glob(s:plug_dir . '/*', 0, 1)) == 0
  autocmd VimEnter * echo "BerserkArch: First run — installing plugins..." |
    \ PlugInstall --sync | source $MYVIMRC
endif

" ── Plugins ──────────────────────────────────────────────
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Custom Keymaps
let mapleader = " "
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>q :qa!<CR>

syntax on
set relativenumber
set ts=2
set sw=2
set termguicolors
set cursorline
set hlsearch
set incsearch
set hidden
set clipboard=unnamedplus
set expandtab
set smartindent

" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

" window navigation
nnoremap <leader>w <C-w>

" buffer navigation
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>b# :bl<CR>
nnoremap <leader>bs :ls<CR>
nnoremap <leader>bb :Buffers<CR>

" undo search highlight
nnoremap <leader>h :noh<CR>

" files
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>fs :w<CR>

" search
nnoremap <leader>st :Rg<CR>
nnoremap <leader>sc :Commands<CR>
nnoremap <leader>sh :History:<CR>

" register
nnoremap <leader>lr :reg<CR>
