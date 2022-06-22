set nocompatible " Enable vim functionality

"  -------
" |Plugins|
"  -------

call plug#begin()
"" LSP client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Native nvim LSP support
" Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer' " Installer of Language servers

"" File explorer
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'https://github.com/preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

"" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'https://github.com/tpope/vim-fugitive' " Git commands

"" GUI improvements
Plug 'https://github.com/morhetz/gruvbox' " Colortheme
Plug 'https://github.com/itchyny/lightline.vim' " Prettier status bar
Plug 'akinsho/bufferline.nvim' " Buffers as tabs for IDES
Plug 'https://github.com/mhinz/vim-startify' " Start screen
Plug 'https://github.com/luochen1990/rainbow' " Rainbow parentheses

"Plug 'https://github.com/Yggdroot/indentLine' " Display the identation levels with pipes |
Plug 'lukas-reineke/indent-blankline.nvim'

" Syntax hl
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'https://github.com/machakann/vim-highlightedyank'

"" Tmux intregation
Plug 'https://github.com/tmux-plugins/vim-tmux' " Syntax hl, commentary, documentation, :make
Plug 'https://github.com/christoomey/vim-tmux-navigator' " vim window movement integration in tmux

" Fuzzy finders
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"" Misc 
Plug 'https://github.com/simnalamburt/vim-mundo' " Better undo tree
Plug 'https://github.com/easymotion/vim-easymotion' " Fastest motion management
Plug 'https://github.com/tpope/vim-surround' " Surround functionality
Plug 'https://github.com/romainl/vim-cool' " disable highlight search automatically when you are done searching


Plug 'https://github.com/tpope/vim-obsession' " Better session management
Plug 'mattn/emmet-vim' " Improve HTML workflow
Plug 'https://github.com/tpope/vim-commentary'
call plug#end()

"  -------
" |Setters|
"  -------

"" Basic
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

"" Gui
set shortmess+=I " Disable the default Vim startup message.
set laststatus=2 " Always show the status line at the bottom, even if you only have one window open.
set noshowmode " Get rid of built-in mode text because of lightline plugin

"" Searching
set hlsearch " Highlight all search patterns after
set ignorecase " Case-insensitive search
set smartcase " The search becomes case-sensitive if it contains any capital letters.
set incsearch " Enable searching as you type rather than waiting til you press enter.

"" Text
" set formatoptions=crqj
" set textwidth=150
" Use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set showmatch           " highlight matching [{()}]

"" Backup 
" if has('nvim')
"     echo 'hello world'
"  	set backup " Enable backup files
"  	set writebackup " Backup after :w, so if :w fails doesn't lose pre :w file
"  	set backupdir=~/.config/nvim/backups/
"  	set backupext=.bak " Backup extension
" endif

"" Swapfiles
set swapfile " Enable swapfiles
set updatetime=300 " Amount of time to save swap files (miliseconds)
set directory=. " Save swapfile in the same dir of the buffer

"" Undo
set undolevels=5000 " Increase undo size
set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir

"" Command mode completion
set wildignorecase " Case insensitive when completing file names and directories.
set wildmenu            " Visual autocomplete for command menu
set wildignore=*.png,*.jpg,*.gif " Extensions to ignore

"" Backspace
set backspace=indent " Backspace de-indent
set backspace+=eol " Backspace over eol to join lines
set backspace+=start " Allow erase more text than you entered durin a single insert command

"" Windows
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"" File encondings
set encoding=utf-8
set fileencoding=utf-8

"" Abbreviations
ab ##s --------------------------------

""  Folds
" set foldmethod=syntax
" autocmd FileType python set foldmethod=indent

set signcolumn=yes " Don't override numbers with git signs or LSP errors

"  ------------ 
" |Autocommands|
"  ------------ 

"" Remember cursor position when re opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"" Highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

"" Default Enter behavior for command window
autocmd CmdwinEnter [:>]  nmap <buffer> <CR> <CR>

"  --------
" |Mappings|
"  --------

"" Wordwise Ctrl-Y in insert mode
" noremap! <M-y> <Esc>klyWjpa
" noremap! <M-e> <Esc>jlyWkpa " This has conflict with emmet snippets, be careful using this.
nnoremap <M-+> <C-a>
nnoremap <M--> <C-x>

"" Dont move cursor after yank
vmap gy myy`y

"" Delete content of line without \n
nnoremap <M-d> 0D

"" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop> 

"" Jump to start and end of line using the home row keys
map H ^
map L $

"" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" Move by line
nnoremap j gj
nnoremap k gk

"" More intuitive Enter behavior (add line without entering in insert mode)
nn <CR> o<Esc>

"" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

"" (Shift)Tab (de)indents code
vnoremap <Tab> >
vnoremap <S-Tab> <

let mapleader=" " " Leader is space

"" Quick quit
nmap <Leader>q :q<CR>
nmap <leader>b :bd<CR>
nmap <Leader>w :w<CR>
nmap <Leader>wq :wq<CR>

"" Quick copy paste
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
vmap <Leader>gy my"+y`y

""  Toggles between buffers
nnoremap <Leader>a <c-^>

"  --------------------
" |Plugin configuration|
"  --------------------

"" Gruvbox - tema pulento

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

"" NERDtree

nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>N :NERDTreeFind<CR>
""" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" Disable signcolumn for NERDTree
autocmd FileType nerdtree setlocal signcolumn=no

""" Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeMinimalUI=1

""" Display hidden files
let NERDTreeShowHidden=1

""" Show line number in nerdtree
let NERDTreeShowLineNumbers=1

""" Close tree after open a file
let NERDTreeQuitOnOpen = 1

""" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1

"" Rainbow parentheses

""" Setup colors and exclude nertree because it cause conflict with devicons with NERDTree
let g:rainbow_conf = {
  \    'guifgs': ['#d65d0e', '#d3869b', '#458588', '#d79921', '#8ec07c', '#cc241d'],
  \    'separately': {
  \       'nerdtree': 0,
  \       'vimwiki': 0
  \    }
  \}

let g:rainbow_active = 1

"" Mundo

nnoremap <leader>u :MundoToggle<CR>

"" fzf

"nmap <leader>: :History:<CR>
"nmap <leader>/ :History/<CR>
"nmap <Leader>, :Buffers<CR>
"nmap <leader>; :BuffersDelete<CR>
"nnoremap <Leader>o :Files<CR>
"nnoremap <leader>. :HFiles<CR>
""nnoremap <Leader>os :ProjectFiles<CR>
"nnoremap <Leader>H :History<CR>

""" BD command to bdelete buffers
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

""" Previews highlight off/ona (sh = syntax highlight)

" ::Files
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

""" Hidden files
command! -bang -nargs=? -complete=dir HFiles call fzf#vim#files(<q-args>, {'source': 'find'}, <bang>0)

""" Floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

""" Border style (rounded / sharp / horizontal)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'fzfFloatingBorder', 'border': 'rounded' } }
hi fzfFloatingBorder guifg=#458788

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

"" Startify

map <Leader>S :Startify<CR>

" startify bookmarks
let g:startify_bookmarks = ['~/.vimrc', '~/.bashrc', '~/.profile', '~/.tmux.conf']

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Most Recent Used Files']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]

"" Easymotion

map <Leader> <Plug>(easymotion-prefix)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'
" JK motions: Line motions
" map <Leader>t <Plug>(easymotion-t2)

map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>s <Plug>(easymotion-s)g

"" LSPnvim

"lua require('lspconfig').pyright.setup{"~/.local/share/nvim/lsp_servers/python/node_modules/.bin/pyright-langserver --stdio"}

"" CoC

""" TextEdit might fail if hidden is not set.
set hidden

""" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

""" Give more space for displaying messages.
set cmdheight=2

""" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

""" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

""" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

""" Use tab for trigger completion with characters ahead and navigate.
""" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
""" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

""" Make <CR> auto-select the first completion item and notify coc.nvim to
""" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""" Use `[g` and `]g` to navigate diagnostics
""" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" lua require'lspconfig'.pyright.setup{}
"

"" CHADTree

map <Leader>t :CHADopen<CR>
let g:chadtree_settings = {
    \"ignore":
        \{"name_glob": [".*"]},
    \"options":
        \{"version_control.enable": v:true},
    \"view":
        \{"window_options":
            \{
                \"number": v:true,
                \"relativenumber": v:true
            \}
        \},
    \"keymap":
        \{
            \"toggle_version_control": ["9"]
        \},
    \"theme.text_colour_set": "nerdtree_syntax_dark"
\}

"" Emmet
"let g:user_emmet_leader_key = '<M-e>'
"
"autocmd FileType html imap <buffer><expr> <tab> Coc_or_emme()

imap <expr> <M-e> emmet#expandAbbrIntelligent("\<M-e>")

"" Bufferline

lua << EOF
require("bufferline").setup{}
EOF

"" Gitsign
lua require('gitsigns').setup()

"" Telescope
nmap <leader>. <cmd>Telescope find_files theme=dropdown<cr>
nmap <leader>, <cmd>Telescope buffers theme=dropdown    <cr>
nmap <leader>: <cmd>Telescope builtin theme=dropdown  <cr>

"" nvim-tree-lua
lua require("nvim-tree").setup()
