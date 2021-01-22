call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'powerline/powerline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vimwiki/vimwiki'
Plug 'blindFS/vim-taskwarrior'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'

call plug#end()

" GENERAL
syntax on
filetype indent plugin on
set clipboard=unnamed
let mapleader = " "
imap jj <Esc>
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
set nu
set mouse=a
set fileformat=unix
set fileformats=unix,dos
set colorcolumn=80
set tw=79
"set nobinary
" set spell
" set spelllang=en

" :set tabstop=4      " To match the sample file
" :set expandtab      " Use spaces instead of tabs
:set tabstop=8 expandtab shiftwidth=4 softtabstop=4

nmap <silent> <C-w>n :tabnext<CR>
nmap <silent> <C-w>p :tabprevious<CR>
nmap <silent> <C-w>c :tabnew<CR>
nmap <silent> <leader>fw :w<CR>

nmap <silent> <leader>oc :e ~/.config/nvim/init.vim<CR>

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

" LeetCode
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
let g:leetcode_browser = 'chrome'

" EasyMotion

" <Leader>f{char} to move to {char}
map  <Leader>jf <Plug>(easymotion-bd-f)
nmap <Leader>jf <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" Vim Wiki
" Hide {{ and }} around code snips.
let g:vimwiki_conceal_pre = 1                           
" wiki dictionary
let wiki = {}                                           
" set wiki path
let wiki.path = '~/Documents/wiki'                      
let wiki.template_path = '~/.wiki/templates'
let wiki.template_default='default'
let wiki.template_ext='.tpl'
" page template
let wiki.html_template = '~/.wiki/html/template.tpl'    
" set syntaxes
let wiki.nested_syntaxes = {'python': 'python'}         
let g:vimwiki_list = [wiki]

" Task Warrior
" Task List
nmap <silent> <leader>tl :TW<CR>
" Add Task
nmap <silent> <leader>ta :TWAdd<CR>

