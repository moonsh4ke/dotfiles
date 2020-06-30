" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
"
set nocompatible "enable vim functionality
" --------------------------------------------------------------------------------------------------------------------------------------------------------
" |Plugins|
" --------------------------------------------------------------------------------------------------------------------------------------------------------
call plug#begin()

" GUI
Plug 'machakann/vim-highlightedyank'
Plug 'morhetz/gruvbox' " colortheme
Plug 'itchyny/lightline.vim' "configurable statusline
Plug 'mhinz/vim-startify' " start screen
" LSP, linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale' "linting engine
Plug 'maximbaz/lightline-ale' " linter status bar
" File management 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "File finder
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' "File explorer
Plug 'tpope/vim-eunuch' "unix shell commands in vim command-line
" Syntax highlight
Plug 'luochen1990/rainbow'             " Rainbow parentheses
Plug 'wlangstroth/vim-racket'   "racket support
Plug 'vim-python/python-syntax' "python
" ciaranm/securemodelines " format c family language
" Movement
Plug 'easymotion/vim-easymotion'
" Text manipulation
Plug 'romainl/vim-cool' " Disables highlight when search is done
Plug 'Yggdroot/indentLine' "Display the identation levelvs with thin vertical lines
Plug 'tpope/vim-commentary' " Comment stuff out
" Running Code
Plug 'skywind3000/asyncrun.vim'
" Git GUI
"Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'             " Git interface
"Plug 'airblade/vim-gitgutter'
"Plug 'xuyuanp/nerdtree-git-plugin'    " Show status of files in NerdTree
" Tmux
Plug 'tmux-plugins/vim-tmux' " syntax hl, commentary, documentation, :make
Plug 'https://github.com/christoomey/vim-tmux-navigator' " vim movement in tmux
"Misc
call plug#end()
" --------------------------------------------------------------------------------------------------------------------------------------------------------
" |Custom Hotkeys|
" --------------------------------------------------------------------------------------------------------------------------------------------------------
" Unbind for tmux
map <C-a> <Nop> 

" quicker window movement
nnoremap <M-j> <C-w>j
nnoremap <M-h> <C-w>h
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Move by line
nnoremap j gj
nnoremap k gk

" anwkward keys for LA layout
nnoremap } ]
nnoremap ° ^

" more intuitive enter behavior (add line without entering in insert mode)

nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" (Shift)Tab (de)indents code
vnoremap <Tab> >
vnoremap <S-Tab> <

" --------------------------------------------------------------------------------------------------------------------------------------------------------
" |Setters & Vim configuration|
" --------------------------------------------------------------------------------------------------------------------------------------------------------

" use 4 spaces instead of tabs during formatting
set expandtab
set noshowmode "get rid of built-in mode text because of lightline
set tabstop=4
set shiftwidth=4
set hlsearch
set softtabstop=4
" set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
syntax on
set guifont=Monospace\ 12 " Toy ciego
set shortmess+=I " Disable the default Vim startup message.
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype specific plugin files
set number " Show line numbers.
set relativenumber " Show relative line numbering
set laststatus=2 " Always show the status line at the bottom, even if you only have one window open.
set backspace=indent,eol,start "allow backspacing over everything
set hidden " allow hide unsaved buffers

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Searching
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
set incsearch " Enable searching as you type, rather than waiting till you press enter.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoying.
set mouse+=a " Enable mouse support
"set nowrap "if the line is longest than windows hide the line
set noswapfile "dont create swap files
set guioptions-=T " Remove toolbar

" --------------------------------------------------------------------------------------------------------------------------------------------------------
" |Leader Shorcuts|
" --------------------------------------------------------------------------------------------------------------------------------------------------------

let mapleader=" "       " leader is space

" Quick run
map <leader>r :AsyncRun -raw python3 % <CR>

" Quick quit
nmap <Leader>q :q<CR>
" todo: shotcut to w and wq

" Quick copy paste
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"  <Space>  --  <leader><leader> toggles between buffers
nnoremap <Leader><Leader> <c-^>

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <gruvbox> - tema pulento
colorscheme gruvbox
set background=dark

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <nerdtree>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <easymotion>
map <Leader> <Plug>(easymotion-prefix)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
" JK motions: Line motions
map <Leader>t <Plug>(easymotion-t2)

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <rainbow parentheses>
let g:rainbow_active = 1

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <ALE>
let b:ale_linters = ["clangd"]
map <leader>at :ALEToggle<CR>
let g:ale_enabled = 0

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <vim-cool>
let g:CoolTotalMatches = 1

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <coc>

"Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Lightline mods for CoC compatibility
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified', 'fugitive' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'filetype', 'fileencoding'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction


let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

" --------------------------------------------------------------------------------------------------------------------------------------------------------

" <fzf>
nmap <Leader>, :Buffers<CR>
"nnoremap <Leader>og :Rg<CR>
nnoremap <Leader>o :Files<CR>
"nnoremap <Leader>os :ProjectFiles<CR>
nnoremap <Leader>h :History<CR>
" Previews highlight off/ona (sh = syntax highlight)

" :Files
" Files preview off, sh off
" command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0)
" Files preview on, sh off
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>,{'options':['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
" Files sh on
"command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" :ProjectFiles
" projectfile previe off, sh off
" command! -bang ProjectFiles call fzf#vim#files('~/Source', <bang>0)
" projectfile preview on, sh off
command! -bang ProjectFiles call fzf#vim#files('~/Source', {'options':['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
" Projectfile preview on, sh on (kinda laggy)
"command! -bang ProjectFiles call fzf#vim#files('~/Source', {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
" --------------------------------------------------------------------------------------------------------------------------------------------------------
