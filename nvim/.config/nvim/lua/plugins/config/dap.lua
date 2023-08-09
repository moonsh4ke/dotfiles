vim.cmd[[nnoremap <silent> <leader>bc <Cmd>lua require'dap'.continue()<CR>]]
vim.cmd[[nnoremap <silent> <leader>bj <Cmd>lua require'dap'.step_over()<CR>]]
vim.cmd[[nnoremap <silent> <leader>bk <Cmd>lua require'dap'.step_back()<CR>]]
vim.cmd[[nnoremap <silent> <leader>bi <Cmd>lua require'dap'.step_into()<CR>]]
vim.cmd[[nnoremap <silent> <leader>bu <Cmd>lua require'dap'.step_out()<CR>]]
vim.cmd[[nnoremap <silent> <Leader>bb <Cmd>lua require'dap'.toggle_breakpoint()<CR>]]
vim.cmd[[nnoremap <silent> <Leader>br <Cmd>lua require'dap'.repl.open()<CR>]]
vim.cmd[[nnoremap <silent> <Leader>bl <Cmd>lua require'dap'.run_last()<CR>]]
vim.cmd[[nnoremap <silent> <Leader>bq <Cmd>lua require'dap'.terminate()<CR>]]
vim.cmd[[nnoremap <silent> <Leader>bd <Cmd>lua require'dap'.clear_breakpoints()<CR>]]
-- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
