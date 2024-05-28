vim.cmd[[command! PandocWrite write | !pandoc "%" -o "%:p:r.pdf"]]
