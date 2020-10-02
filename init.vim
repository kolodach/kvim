call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'powerline/powerline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'	  " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

" GENERAL
syntax on
set clipboard=unnamed
let mapleader = " "
imap jj <Esc>
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set nu
set mouse=a
set fileformat=unix
set fileformats=unix,dos
"set nobinary
set spell
set spelllang=en

:set tabstop=4		" To match the sample file
:set expandtab		" Use spaces instead of tabs
:%retab!			" Retabulate the whole file

nmap <silent> <C-w>n :tabnext<CR>
nmap <silent> <C-w>p :tabprevious<CR>
nmap <silent> <C-w>c :tabnew<CR>

" NERDTREE
autocmd StdinReadPre * let s:std_in=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <silent> <leader>e :NERDTreeToggle<CR>
" Initial NERDTree width
let NERDTreeWinSize=50
" Close NERDtree when files was opened
let NERDTreeQuitOnOpen=1
" Show NERDTree bookmarks
let NERDTreeShowBookmarks=1
" Display arrows instead of ascii art in NERDTree
let NERDTreeDirArrows=1
" Change current working directory based on root directory in NERDTree
 let NERDTreeChDirMode=2
" Start NERDTree in minimal UI mode (No help lines)
let NERDTreeMinimalUI=1
" Reveal file in NERDTree
map <leader>fr :NERDTreeFind<cr>

nmap <silent> <leader>sg :GFiles<CR>
nmap <silent> <leader>sf :Files<CR>
nmap <silent> <leader>sa :Ag<CR>

" Airline
let g:airline_powerline_fonts = 1

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Formatting selected code.
xmap <silent> <leader>ff <Plug>(coc-format-selected)
nmap <silent> <leader>ff :CocCommand eslint.executeAutofix<CR>
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
