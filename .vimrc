" --------------------
" Plugin manager setup
" --------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

" --------------------
" General Settings
" --------------------
set nocompatible
syntax on
filetype plugin indent on
set number                      " número de linhas
set relativenumber              " números relativos (útil pra navegar)
set tabstop=4
set shiftwidth=4
set expandtab                   " usa espaços no lugar de tabs
set autoindent
set smartindent
set clipboard=unnamedplus       " integra com clipboard do sistema
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a                     " ativa mouse
set termguicolors
set term=xterm-256color
set nobackup
set nowritebackup
set encoding=utf-8
set updatetime=300
colorscheme desert

" Define a tecla líder
let mapleader = " "

" --------------------
" Fuzy 
" --------------------
" Buscar arquivos 
nnoremap <leader>ff :Files<CR>

" Buscar conteúdo dentro dos arquivos 
nnoremap <leader>fg :Rg<CR>

" Buscar buffers abertos
nnoremap <leader>fb :Buffers<CR>

" Histórico de comandos
nnoremap <leader>fh :History<CR>

" --------------------
" Atalhos úteis
" --------------------


" Quit
nnoremap <leader>qq :qa!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>

" Save
nnoremap <C-s> :w<CR>

nnoremap <C-v> <C-v>

" Fugitive
nnoremap <leader>of :G<CR>:only<CR>

" Não copiar para o clipboard com x
nnoremap x "_x

" Split windows
nnoremap <leader>sh :sp<CR>
nnoremap <leader>sv :vs<CR>

" Mover entre janelas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Redimensionar janelas
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <leader>we <C-w>=

" Mover linha ou bloco selecionado (modo visual)
xnoremap <S-j> :move '>+1<CR>gv-gv
xnoremap <S-k> :move '<-2<CR>gv-gv

" Cursor no centro ao buscar
nnoremap n nzzzv
nnoremap N Nzzzv

" Melhor indentação em modo visual
vnoremap > >gv
vnoremap < <gv

" Colar sem copiar o que está sendo substituído
vnoremap p "_dP

" Cancelar realce de busca
nnoremap <Esc> :nohlsearch<Bar>:echo<CR>


" --------------------
" Coc.nvim 
" --------------------
" Use :CocInstall coc-tsserver coc-json coc-html etc.
" Para linguagens específicas
" Ir para definição
nmap <silent> gd <Plug>(coc-definition)

" Ir para referencias
nmap <silent> gr <Plug>(coc-references)

" Mostrar tipo e documentação da variável/função sob o cursor
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Autocompletar com <Tab>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Format exp
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" --------------------
" GitGutter 
" --------------------
let g:gitgutter_sign_added = '|'
let g:gitgutter_use_location_list = 1

command! Gqf GitGutterQuickFix | copen


" --------------------
" Vim commands 
" --------------------

" Criar pasta
command! -nargs=1 Mkdir execute '!mkdir -p ' . shellescape(<q-args>)

" Criar arquivo
command! -nargs=1 Touch  execute '!touch ' . shellescape(<q-args>)

" Copiar arquivo ou pasta
command! -nargs=+ Cp  execute '!cp -r ' . shellescape(<q-args>)

" Mover ou renomear
command! -nargs=+ Mv  execute '!mv ' . shellescape(<q-args>)
