"Plug-ins
call plug#begin('~/.vim/plugged')
" Tools
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

" Syntax
    Plug 'tpope/vim-markdown'
    Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
    Plug 'vim-scripts/fountain.vim'
" Color-schemes
    Plug 'morhetz/gruvbox' "My favorite theme
    Plug 'bluz71/vim-nightfly-guicolors'
" COC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
 "Rust plugins
    Plug 'rust-lang/rust.vim'
" file searching
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
" Startup plugin
    Plug 'mhinz/vim-startify' 
" Directory structure display
" web-dev
    Plug 'mattn/emmet-vim'
" md-preview
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

call plug#end() 
 
"General Settings
syntax enable
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
set autoread
set wildmenu
set number relativenumber
set nu rnu
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set noruler
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
set hls is ic
set laststatus=2 cmdheight=1
set splitbelow splitright 
set nobackup nowritebackup
set nohlsearch
set nowrap
set incsearch
set viminfo='100,n$HOME/.vim/files/info/viminfo

"Key-bindings
let mapleader=" "
nnoremap <leader><ENTER> :Goyo<CR>
nnoremap <leader>, :vsplit ~/.vimrc<CR>
nnoremap <leader>g :GitGutterDisable <BAR> :set laststatus=0 <CR>
nnoremap <C-l> :set background=light<CR>
nnoremap <C-s> :source ~/.vimrc<CR>

nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv


nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

"gk and gk
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
"tab switching
nnoremap H gT
nnoremap L gt
"terminal opening settings

nnoremap <leader>t :botright vertical terminal<CR>
set termwinsize=100*35

"Search and replace
nnoremap S :%s//g<Left><Left>

"Copy paste within vim 
noremap <C-c> :w !pbcopy<CR><CR> 
noremap <C-p> :r !pbpaste<CR><CR>

"Color Settings
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:solarized_termcolors=256

"limelight config
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"Make alacritty transparent in vim

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

"Goyo settings
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    Limelight
endfunction

function! s:goyo_leave()
    hi! Normal ctermbg=NONE guibg=NONE
    hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
    set showmode
    set showcmd
    Limelight! 
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"fzf
nnoremap <C-p> :Files<Cr>
let $FZF_DEFAULT_OPTS = "--preview 'bat {}'"
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'



"Startify
let g:startify_bookmarks = [
  \ { 'b': '~/.bashrc' },
  \ { 'v': '~/.vimrc' },
  \ { 'ki': '~/.config/kitty/kitty.conf'},
  \ { 'a': '~/.config/alacritty/alacritty.yml'},
  \ ]
let g:startify_lists = [
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   MRU'],            'type': 'files' },
      \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
      \ ]


let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

