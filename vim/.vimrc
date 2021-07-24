set nocompatible " Enable vim functionality

" automatic ctags https://stackoverflow.com/questions/155449/vim-auto-generate-ctags
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" Plug justify text macro (h 25.3)
packadd justify

" --------------------------------
" |Plugins|
" --------------------------------

call plug#begin()
Plug 'https://github.com/morhetz/gruvbox' " Colortheme
Plug 'https://github.com/mhinz/vim-startify' " Start screen
Plug 'https://github.com/preservim/nerdtree' " File explorer
Plug 'https://github.com/luochen1990/rainbow' " Rainbow parentheses
Plug 'https://github.com/easymotion/vim-easymotion' " Fastest motion management
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/Yggdroot/indentLine' " Display the identation levelvs with pipes |

Plug 'https://github.com/tmux-plugins/vim-tmux' " Syntax hl, commentary, documentation, :make
Plug 'https://github.com/christoomey/vim-tmux-navigator' " vim window movement integration in tmux

Plug 'https://github.com/simnalamburt/vim-mundo' " Better undo tree
Plug 'https://github.com/itchyny/lightline.vim' " Prettier status bar
Plug 'https://github.com/tpope/vim-surround' " Surround functionality
Plug 'https://github.com/romainl/vim-cool' " disable highlight search automatically when you are done searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" --------------------------------
" |Setters & Vim configuration|
" --------------------------------

" Basic

syntax on
set number " Show line numbers.
set relativenumber " Show relative line numbering
set hidden " Allow hide unsaved buffers
set noerrorbells visualbell t_vb= " Disable audible bell because it's annoying.
set mouse+=a " Enable mouse support
set scrolloff=12        " Keep cursor in approximately the middle of the screen
set guioptions-=T " Remove toolbar

if has('nvim')
	set inccommand=nosplit " Live preview of substituion
endif

set whichwrap=h,l " If the end or the beggining of a line is reached keep moving to the previous/next line
" --------------------------------

" Gui

set shortmess+=I " Disable the default Vim startup message.
set laststatus=2 " Always show the status line at the bottom, even if you only have one window open.
set noshowmode " Get rid of built-in mode text because of lightline plugin
" --------------------------------

" Searching

set hlsearch " Highlight all search patterns after
set ignorecase " Case-insensitive search
set smartcase " The search becomes case-sensitive if it contains any capital letters.
set incsearch " Enable searching as you type rather than waiting til you press enter.
" --------------------------------

" Text

" set formatoptions=crqj
" set textwidth=150

" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set showmatch           " highlight matching [{()}]
" --------------------------------

" Backup 

" if has('nvim')
" 	set backup " Enable backup files
" 	set writebackup " Backup after :w, so if :w fails doesn't lose pre :w file
" 
" 	set backupdir=~/.config/nvim/backups/,~/.config/nvim/backups/backups2/
" 	set backupext=.bak " Backup extension
" endif
" --------------------------------

" Swapfiles

set swapfile " Enable swapfiles
set updatetime=300 " Amount of time to save swap files (miliseconds)
set directory=. " Save swapfile in the same dir of the buffer

" --------------------------------

" Undo

set undolevels=5000 " Increase undo size
set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir
" --------------------------------

" Command mode completion

set wildignorecase " Case insensitive when completing file names and directories.
set wildmenu            " Visual autocomplete for command menu
set wildignore=*.png,*.jpg,*.gif " Extensions to ignore
" --------------------------------

" Backspace

set backspace=indent " Backspace de-indent
set backspace+=eol " Backspace over eol to join lines
set backspace+=start " Allow erase more text than you entered during a single insert command
" --------------------------------

" Windows

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" --------------------------------

" Abbreviations

ab ##s --------------------------------

" Autocommands

" Remember cursor position when re opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" --------------------------------
" |Custom Hotkeys|
" --------------------------------
"
" Wordwise Ctrl-Y in insert mode
noremap! <M-y> <Esc>klyWjpa
noremap! <M-e> <Esc>jlyWkpa

nnoremap <M-+> <C-a>
nnoremap <M--> <C-x>

vmap gy myy`y

nnoremap <M-d> 0D

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Jump to start and end of line using the home row keys
map H ^
map L $

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move by line
nnoremap j gj
nnoremap k gk

" More intuitive enter behavior (add line without entering in insert mode)
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

" --------------------------------
" |Leader Shorcuts|
" --------------------------------

let mapleader=" "       " leader is space

" Quick quit
nmap <Leader>q :q<CR>
nmap <leader>b :bd<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>

" Quick copy paste
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vmap <Leader>gy my"+y`y

"  <Space>  --  <leader><leader> toggles between buffers
nnoremap <Leader>a <c-^>

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
" --------------------------------

" <gruvbox> - tema pulento

" Deal with term colors
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:gruvbox_sign_column='bg0' " Sign Column same color as background
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0' " Proper visual mode selection color
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" Set background to none so tmux can set active pane as darknest one and
" inactive as lighter
highlight Normal ctermbg=none guibg=none

" <nerdtree>

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable signcolumn for NERDTree
autocmd FileType nerdtree setlocal signcolumn=no

" Disables display of the 'Bookmarks' label and
" 'Press ? for help' text.
let NERDTreeMinimalUI=1

" Display hidden files
let NERDTreeShowHidden=1

" Show line number in nerdtree
let NERDTreeShowLineNumbers=1

" Close tree after open a file
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1


" --------------------------------
" <rainbow parentheses>

" Setup colors and exclude nertree because it cause conflict with devicons
" with NERDTree
let g:rainbow_conf = {
  \    'guifgs': ['#d65d0e', '#d3869b', '#458588', '#d79921', '#8ec07c', '#cc241d'],
  \    'separately': {
  \       'nerdtree': 0,
  \       'vimwiki': 0
  \    }
  \}
let g:rainbow_active = 1
" --------------------------------
" <Mundo-tree>

nnoremap <leader>u :MundoToggle<CR>
" --------------------------------

" <fzf>

nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>
nmap <Leader>, :Buffers<CR>
nmap <leader>; :BuffersDelete<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <leader>. :HFiles<CR>
"nnoremap <Leader>os :ProjectFiles<CR>
nnoremap <Leader>H :History<CR>

" BD command to bdelete buffers
function! s:delete_buffers(lines)
  execute 'bdelete!' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

command! BuffersDelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

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

" Hidden files
command! -bang -nargs=? -complete=dir HFiles call fzf#vim#files(<q-args>, {'source': 'find'}, <bang>0)

" Floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'fzfFloatingBorder', 'border': 'rounded' } }
hi fzfFloatingBorder guifg=#458788
"" Todo: play with these settings

let g:fzf_colors =
\ { 'fg':      ['fg', 'fzfFg'],
  \ 'bg':      ['bg', 'fzfBg'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

hi fzfFg guifg=#d5c4a1
hi fzfBg guibg=#1d2021

" --------------------------------
"<startify>

map <Leader>S :Startify<CR>


" --------------------------------

" <easymotion>

map <Leader> <Plug>(easymotion-prefix)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
" JK motions: Line motions
map <Leader>t <Plug>(easymotion-t2)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>s <Plug>(easymotion-s)
