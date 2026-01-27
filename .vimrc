" ============================
" Plugin Manager Setup
" ============================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify', {'branch': 'center'}
Plug 'vim-autoformat/vim-autoformat'
Plug 'vim-airline/vim-airline'


call plug#end()

" ============================
" General Settings
" ============================
set nocompatible
syntax on
filetype plugin indent on
set number                      " show line numbers
set relativenumber              " show relative line numbers (useful for navigation)
set tabstop=4
set shiftwidth=4
set expandtab                   " use spaces instead of tabs
set autoindent
set smartindent
set clipboard=unnamedplus       " integrate with system clipboard
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a                     " enable mouse
set termguicolors
set term=xterm-256color
set nobackup
set nowritebackup
set encoding=utf-8
set updatetime=300
colorscheme desert

" Define leader key
let mapleader = " "

" ============================
" Fuzzy Finder
" ============================
" Search files
nnoremap <leader>ff :Files<CR>

" Search content inside files
nnoremap <leader>fg :Rg<CR>

" Command history
nnoremap <leader>fh :History<CR>

" ============================
" Useful Shortcuts
" ============================

" Quit
nnoremap <leader>qq :q<CR>
nnoremap <leader>wq :wq<CR>

" Folder
nnoremap <leader>od :Ex<CR>

" Save
nnoremap <C-s> :w<CR>

nnoremap <C-v> <C-v>

" Fugitive
nnoremap <leader>of :G<CR>:only<CR>

" Delete without copying to clipboard
nnoremap x "_x

" Split windows
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vs<CR>

" Move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <leader>we <C-w>=

" Move line or selected block (visual mode)
xnoremap <S-j> :move '>+1<CR>gv-gv
xnoremap <S-k> :move '<-2<CR>gv-gv

" Keep cursor centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Better indentation in visual mode
vnoremap > >gv
vnoremap < <gv

" Paste without overwriting the clipboard
vnoremap p "_dP

" Cancel search highlight
nnoremap <Esc> :nohlsearch<Bar>:echo<CR>


" ============================
" Coc.nvim
" ============================
" Use :CocInstall coc-tsserver coc-json coc-html etc.

" Go to diagnostic
nmap <silent><nowait> [d <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]d <Plug>(coc-diagnostic-next)

" Show all diagnostics
nnoremap <silent><nowait> <space>ld  :CocDiagnostics<cr>

" Go to definition
nmap <silent> gd <Plug>(coc-definition)

" Go to references
nmap <silent> gr <Plug>(coc-references)

" Show type and documentation for variable/function under cursor
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

" Autocomplete with <Tab>
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Format example
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" --------------------
" GitGutter
" --------------------
let g:gitgutter_sign_added = '|'
let g:gitgutter_use_location_list = 1

command! Gqf GitGutterQuickFix | copen


" ============================
" Vim Commands
" ============================

" Create directory
command! -nargs=1 Mkdir execute '!mkdir -p ' . shellescape(<q-args>)

" Create file
command! -nargs=1 Touch  execute '!touch ' . shellescape(<q-args>)

" Copy file or folder
command! -nargs=+ Cp  execute '!cp -r ' . shellescape(<q-args>)

" Move or rename
command! -nargs=+ Mv  execute '!mv ' . shellescape(<q-args>)

" ============================
" vim-fugitive commands
" ============================

" Change  branch
command! -nargs=1 Gco execute 'Git checkout ' . <q-args>

" Create new  branch
command! -nargs=1 Gnb execute 'Git checkout -b ' . <q-args>

" Show diff
command! Gdf execute 'Git diff'

" Show diff file
command! Gdfa execute 'Git diff %'

" Add file
command! Gadd execute 'Git add %'

" Fast commit
command! -nargs=? Gcommit execute 'Git commit ' . (<q-args> != '' ? '-m ' . shellescape(<q-args>) : '')

" Git status
command! Gst execute 'Git'

" ============================
" Startify config
" ============================

let g:jesus_ascii = [
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⠘⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣃⣀⣀⣀⣸⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⡇⠀⠀⠀⢹⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⣸⡇⡇⣸⣿⡇⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢀⣨⣷⣞⣛⣯⣿⣿⣿⡿⣽⣿⣇⣤⣸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣤⣾⣿⡿⢿⣿⣿⣿⣿⣿⣟⣛⣿⣿⣿⣿⣿⣿⣧⣠⠂⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣖⣲⣿⣿⠟⣻⣤⣾⣿⡿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣗⢺⣿⣶⣴⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⣼⣿⣿⣶⡿⠿⠟⣫⣶⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣶⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⣠⣴⡿⣿⣿⣿⣿⢿⣿⣽⣿⣿⠚⠛⠋⠉⠉⠉⣉⣽⣋⡛⢿⣿⣯⢻⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⢶⣤⡀⠀⠀⠀⠀⠀⠀",
            \ "⠀⣀⣠⡶⠿⠋⠁⠀⡇⠰⢿⣻⣿⣿⣿⣿⡇⠀⣀⡀⠀⣾⣿⣿⣿⣿⣯⡗⠟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⡀⣿⠀⠉⠛⢷⣦⣀⡀⠀⠀",
            \ "⠀⠛⠻⣷⣤⡀⠀⠀⣇⡴⠚⠛⣿⣿⣿⣹⣷⣾⣿⣿⡄⠀⠟⢿⣿⠯⠋⠀⠀⠘⢿⣿⣿⣿⣿⣿⣻⣿⣿⣟⡿⠛⣿⠀⠀⣠⣴⣿⠟⠃⠀⠀",
            \ "⠀⠀⠀⠀⠉⠻⢷⣴⣧⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⡽⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣾⣿⣻⣿⣿⣿⣶⣶⣿⣶⠿⠋⠁⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢽⣿⣿⣿⣿⡅⠉⠀⣀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣯⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢈⣿⣿⣿⣿⡀⠀⠈⠛⡿⣄⣴⣶⣆⣦⣴⣦⣹⣾⣿⣿⣿⣿⢿⣿⣿⣏⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢫⣿⣿⣿⣿⣿⡆⣤⣾⣿⣾⠿⠛⢿⣿⣯⣿⣿⣿⣿⡿⢸⣿⣸⣿⣿⡛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣽⣿⣿⣿⣿⣿⣿⣿⣶⣾⠁⣀⣿⣿⣿⣛⣿⣽⠉⢸⣿⡿⡿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣘⣿⣿⣯⣾⣿⣿⣿⣿⣿⡟⠐⢿⣟⣋⣽⠋⣿⣿⠟⠁⠀⢸⣿⣿⣷⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠠⣤⠶⠶⠒⠛⠉⣉⣩⡥⠿⠿⠽⠽⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⢿⣿⣭⣏⣿⠟⠀⠀⣰⠀⢠⣿⣿⣿⠿⠿⠯⠭⠽⣽⣏⡙⠳⠶⠶⠦⣤⣄",
            \ "⠀⠉⢧⡀⠀⠀⢸⡿⣄⡀⠀⠀⠀⢠⣿⢹⣿⣿⣿⣿⣿⣿⣷⢿⣳⣾⢟⡟⠁⠀⠀⠀⡟⠀⠈⣿⣿⣿⣧⠀⠀⠀⠀⠀⣸⣿⠀⠀⠠⣄⡾⠁",
            \ "⠀⠀⢀⡿⠀⠀⠀⣷⠀⠻⠝⠒⠶⠶⠿⠷⠿⠿⠿⠿⠿⣿⣯⣾⣿⣉⣯⣀⣀⣀⣀⣸⣄⣠⣤⣿⠿⠿⠾⠤⠶⠶⠚⠉⢁⣾⠀⠀⠀⠸⣇⠀",
            \ "⠀⢀⡞⠁⢀⣀⣠⡿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣄⣀⡀⠀⢹⡄",
            \ "⠀⠸⠛⠋⠉⠉⠉⣧⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠈⠉⠉⠙⠚⠿",
            \ "⠀⠀⠀⠀⠀⠀⠀⠛⠦⣄⣀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠞⣀⣀⣤⠾⠋⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠒⠶⠶⠶⠦⠶⠶⠶⢶⣶⡶⢶⣾⡶⢶⣶⡶⠶⠶⠶⠶⠶⠶⠶⠚⠛⠛⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⢀⣿⡇⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⠀⢸⣷⡇⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⢸⣯⡇⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠘⣿⡇⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣧⠀⠀⠛⠃⢸⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣯⠉⠉⠉⠁⢙⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⣠⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            \ "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣘⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            \ ]

let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   Recent files']       },
            \ { 'type': 'dir',       'header': ['   Actual files'] },
            \ { 'type': 'bookmarks', 'header': ['   Projects']               },
            \]

let g:startify_bookmarks = [
            \ { 'c': '~/.vimrc' },
            \ { 'z': '~/.zshrc' },
            \ { 'g': '~/projetos/' },
            \ { 's': '~/estudos' },
            \]

let g:startify_custom_header = 'startify#pad(g:jesus_ascii)'
let g:startify_padding_left = 80

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_OPTS .= ' --bind=ctrl-n:down,ctrl-p:up'
let $FZF_DEFAULT_OPTS .= ' --preview-window=right:50%:wrap'

set directory=~/.vim/swap//

if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p", 0700)
endif
