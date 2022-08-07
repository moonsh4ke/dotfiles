-- Startify

map = vim.api.nvim_set_keymap
map('','<Leader>S', ':Startify<CR>', {})

-- Startify bookmarks
vim.cmd([[
    let g:startify_bookmarks = ['~/.vimrc', '~/.bashrc', '~/.profile', '~/.tmux.conf']

    let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Most Recent Used Files']            },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \]
]])
