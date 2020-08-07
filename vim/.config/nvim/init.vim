set nocompatible " Enable vim functionality

" --------------------------------
" |Plugins|
" --------------------------------

call plug#begin()

" GUI

Plug 'https://github.com/morhetz/gruvbox' " Colortheme
Plug 'https://github.com/itchyny/lightline.vim' " Configurable statusline
Plug 'https://github.com/mhinz/vim-startify' " Start screen
Plug 'https://github.com/kshenoy/vim-signature' " Show marks in the sign bar
Plug 'https://github.com/ryanoasis/vim-devicons/' " Add Nerdfonts icons to file extensions
" ---------------------------------

" LSP, linting

Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} " LSP support 
Plug 'https://github.com/dense-analysis/ale' " Linting engine
Plug 'https://github.com/maximbaz/lightline-ale' " Linter status bar
" --------------------------------

" File management 

Plug '$HOME/.fzf'
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy search for files
Plug 'https://github.com/preservim/nerdtree' " File explorer
Plug 'https://github.com/tpope/vim-eunuch' " Unix shell commands in vim command-line
" --------------------------------

" Syntax highlight

Plug 'https://github.com/luochen1990/rainbow' " Rainbow parentheses
Plug 'https://github.com/wlangstroth/vim-racket' " Racket support
Plug 'https://github.com/vim-python/python-syntax' " Python
Plug 'https://github.com/rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Color support (needs golang)
Plug 'https://github.com/plasticboy/vim-markdown'
" --------------------------------

" Text manipulation
Plug 'https://github.com/tpope/vim-surround' " Easy management for sorroundings
Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/Yggdroot/indentLine' " Display the identation levelvs with thin vertical lines
Plug 'https://github.com/tpope/vim-commentary' " Comment stuff out

Plug 'https://github.com/easymotion/vim-easymotion' " Fastest motion management
Plug 'https://github.com/haya14busa/incsearch.vim' " Enhancement for incsearch a.k.a '/'
Plug 'https://github.com/haya14busa/incsearch-easymotion.vim'

Plug 'https://github.com/godlygeek/tabular' " Text aligment
" --------------------------------

" Git

Plug 'https://github.com/tpope/vim-fugitive' " Git interface
Plug 'https://github.com/airblade/vim-gitgutter' " Asynchronous git diff
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin' " Show status of files in NerdTree
" --------------------------------

" Tmux

Plug 'https://github.com/christoomey/vim-tmux-navigator' " vim window movement integration in tmux
Plug 'https://github.com/tmux-plugins/vim-tmux' " Syntax hl, commentary, documentation, :make
" --------------------------------

" Language interface enhancement

Plug 'https://github.com/tpope/vim-dadbod' " Databases support
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" --------------------------------

" Misc enhancements and functionalities

Plug 'https://github.com/vim-scripts/BufOnly.vim' " Close all buffers but not the one opened
Plug 'https://github.com/tpope/vim-obsession' " Session management
Plug 'https://github.com/liuchengxu/vim-which-key' " Pop-up to manage keybindings
" --------------------------------

" Testing zone

" Plug 'https://github.com/roxma/vim-tmux-clipboard' " tmux cpy mode to unnamed registry
" https://github.com/reedes/vim-pencil " Dunno but have decent amount of stars
" Plug 'https://github.com/kristijanhusak/vim-dadbod-ui' " UI for dadbod
" Plugin 'jceb/vim-orgmode'
" Plug 'https://github.com/raimondi/delimitmate' " Automatic (), {}
" Plug 'https://github.com/SirVer/ultisnips' " Templates 
" Plug 'https://github.com/wakatime/vim-wakatime' " Vim's activity statistics
" Plug 'https://github.com/tpope/vim-rsi' " Command lines readline
" ciaranm/securemodelines " Format c family language
" --------------------------------

call plug#end()

" Plug justify text macro (h 25.3)
packadd justify

" --------------------------------
" |Custom Hotkeys|
" --------------------------------

" Todo: Change more Ctrl keys

" Select all
nmap <C-a> ggVG 

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

" Anwkward keys for LA layout
nnoremap <C-}> <C-]>
nnoremap ° ^

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
" |Setters & Vim configuration|
" --------------------------------

syntax on
set inccommand=nosplit " Live preview of substituion
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set noshowmode "get rid of built-in mode text because of lightline
set hlsearch
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set shortmess+=I " Disable the default Vim startup message.

" Command mode completion
set wildmenu            " visual autocomplete for command menu
set wildignore=*.png,*.jpg,*.gif " Extensions to ignore

set showmatch           " highlight matching [{()}]
" filetype indent on      " load filetype-specific indent files
" filetype plugin on      " load filetype specific plugin files
set number " Show line numbers.
set relativenumber " Show relative line numbering
set laststatus=2 " Always show the status line at the bottom, even if you only have one window open.

" indent: backspace de-indent, eol: backspace over eol to join lines,
" start: erase more text than you entered diring a single insert command
set backspace=indent,eol,start 

set hidden " Allow hide unsaved buffers

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Continue comments when pressing ENTER in I mode
" Dont continue comment after o and O
autocmd FileType * setlocal formatoptions+=r formatoptions-=o

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

" Maintain undo history between sessions
set undofile 
set undodir=~/.config/nvim/undodir

set scrolloff=12        " Keep cursor in approximately the middle of the screen

" Quick separator
ab ##s --------------------------------


" --------------------------------
" |Leader Shorcuts|
" --------------------------------

let mapleader=" "       " leader is space

" Quick quit
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>
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
" --------------------------------

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

" Colors
" TODO: update help menu colors

" Files
hi NerdTreeFile guifg=#458788
hi NERDTreeExecFile guifg=#98971a
hi NERDTreeLinkFile guifg=#d79921
hi NERDTreeLinkTarget guifg=#d79921

" Directories
hi NERDTreeDirSlash guifg=#d65d0e
hi NERDTreeDir guifg=#a89984
hi NERDTreeOpenable guifg=#a89984
hi NERDTreeClosable guifg=#a89984
hi NERDTreeFlags guifg=#a89984

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

" --------------------------------

" <rainbow parentheses>

" Setup colors and exclude nertree because it cause conflict with devicons
" with NERDTree
let g:rainbow_conf = {
  \    'guifgs': ['#d65d0e', '#d3869b', '#458588', '#d79921', '#8ec07c', '#cc241d'],
  \    'separately': {
  \       'nerdtree': 0
  \    }
  \}
let g:rainbow_active = 1
" --------------------------------

" <ALE>

map <leader>at :ALEToggle<CR>

" ALE only start in the specified ale_linters
let g:ale_linters_explicit = 1
" --------------------------------

" <vim-cool>

let g:CoolTotalMatches = 1
" --------------------------------

" <coc>

"Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Lightline mods for CoC compatibility
" Todo: Fix ale linter icons
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'readonly', 'cocstatus', 'currentfunction', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'wordcount' , 'filetype', 'fileencoding'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'wordcount': 'WordCount'
      \ },
      \ }

	function! LightlineReadonly()
		return &readonly ? '' : ''
	endfunction
	function! LightlineFugitive()
		if exists('*FugitiveHead')
			let branch = FugitiveHead()
			return branch !=# '' ? ''.branch : ''
		endif
		return ''
	endfunction

function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" let g:lightline.component_type = {
"       \     'linter_checking': 'right',
"       \     'linter_infos': 'right',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'right',
"       \ }
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

" <vim-hexokinase>

let g:Hexokinase_highlighters = ['backgroundfull']
set termguicolors
" --------------------------------

" <vim-markdown>

set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
" --------------------------------

" <Mundo-tree>

nnoremap <leader>u :MundoToggle<CR>
" --------------------------------

" <Startify>

nnoremap <leader>S :Startify<CR>
let g:startify_session_dir = '~/sessions'
let g:startify_change_to_dir = 1 " When opening a file or bookmark, change to its directory.
let g:startify_files_number = 5 " Max. number of files to show

" CAREFUL: Do not override Startify built-in mappings (e, i, q, b, s, v, t)

" Custom
let g:startify_bookmarks = [{'a': '~/.alacritty.yml'}, {'l': '~/.aliases.sh'}, {'n': '~/.config/nvim/init.vim'}, {'m': '~/.tmux.conf'}, {'z': '~/.zshrc' } ]

" Commands
let g:startify_commands = [
    \ ':help reference',
    \ ['Startify documentation', 'help startify'],
    \ ]

" Start indices from 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')

highlight StartifyBracket guifg=#a89984
highlight StartifyNumber guifg=#d79921
" highlight StartifyFooter guifg=
highlight StartifyHeader guifg=#458788
highlight StartifyPath guifg=#a89984
highlight StartifySlash guifg=#d65d0e
highlight StartifyFile guifg=#458788
highlight StartifySection guifg=#98971a
" highlight StartifySelect guifg=
highlight StartifySpecial guifg=#a89984
" highlight StartifyVar guifg=

let g:startify_custom_header = [                                                                                       
      \'   __                 __                   __      __                   ',
      \'  /\ \__             /\ \__               /\ \  __/\ \__                ',
      \'  \ \ ,_\    __  __  \ \ ,_\         __   \_\ \/\_\ \ ,_\   ___   _ __  ',
      \'   \ \ \/  /''__`/\ \/''\ \ \/       /''__`\ /''_` \/\ \ \ \/  / __`\/\`''__\',
      \'    \ \ \_/\  __\/>  </\ \ \_     /\  __//\ \L\ \ \ \ \ \_/\ \L\ \ \ \/ ',
      \'     \ \__\ \____/\_/\_\\ \__\    \ \____\ \___,_\ \_\ \__\ \____/\ \_\ ',
      \'      \/__/\/____\//\/_/ \/__/     \/____/\/__,_ /\/_/\/__/\/___/  \/_/ '
      \      ] 

" Deal with the list that is going to be show by Startify


let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'files',     'header': ['   Recently Open']            },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },

" Run startify on new tabs
if has('nvim')
  autocmd TabNewEntered * Startify
else
  autocmd BufWinEnter *
        \ if !exists('t:startify_new_tab')
        \     && empty(expand('%'))
        \     && empty(&l:buftype)
        \     && &l:modifiable |
        \   let t:startify_new_tab = 1 |
        \   Startify |
        \ endif
endif

" --------------------------------

" <dadbod>

vmap <Leader>D :DB<CR>
" DB g:db = mysql://root@localhost/giraffe/

" let g:dbs = {
" \  'comp': 'mysql://root@localhost/giraffe'
" \ }
" --------------------------------
" <vim-signature>

nnoremap <leader>m :SignatureToggle<CR>
let g:SignatureEnabledAtStartup=0
" --------------------------------

" <whichkey>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" --------------------------------

" <gitgutter>

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
" --------------------------------

" <incsearch>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" automatic nohlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" --------------------------------

" <incsearch-easymotion>

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" map <Leader>/ <Plug>(incsearch-easymotion-/)

" map <Leader>g/ <Plug>(incsearch-easymotion-stay)
" --------------------------------

" <devicons>

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" Fix buggy behavior of glyphs in NERDTree after source init.vim
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
" --------------------------------

" <LateX>

" Aparently count the number of words in a LateX document
map <F3> :w !detex \| wc -w<CR>
