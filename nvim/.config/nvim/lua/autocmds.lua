-- Autocommands

local autocmd = vim.api.nvim_create_autocmd

autocmd(
	{'BufReadPost'},
	{
	    pattern = {'*'},
	    command = 'if line("\'\\"") > 0 && line("\'\\"") <= line("$") | exe "normal! g`\\"" | endif'
    }
)

vim.api.nvim_create_augroup('CursorLineOnlyInActiveWindow', {})

autocmd(
	{'VimEnter','WinEnter','BufWinEnter'},
	{
	    pattern = {'*'},
	    command = 'setlocal cursorline',
        group = 'CursorLineOnlyInActiveWindow'
    }
)

autocmd(
	{'WinLeave'},
	{
	    pattern = {'*'},
	    command = 'setlocal nocursorline',
        group = 'CursorLineOnlyInActiveWindow'
    }
)

autocmd(
	{'CmdwinEnter'},
	{
	    pattern = {'[:>]'},
	    command = 'nmap <buffer> <CR> <CR>'
    }
)


autocmd(
	{'TextYankPost'},
	{
		pattern = {'*'},
		callback = function() vim.highlight.on_yank({timeout="500"}) end
	}
)

-- Buffer listed help files
-- autocmd(
-- 	{'FileType'},
-- 	{
-- 		pattern = {"help"},
-- 		command = "set bl"
-- 	}
-- )

-- vim.cmd[[
-- autocmd FileType help echo "hello world from help"
-- ]]
