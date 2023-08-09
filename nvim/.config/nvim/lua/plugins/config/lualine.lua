local lualine = require('lualine')

lualine.setup {
    sections = {
        lualine_c = {
            function()
                return vim.fn.pathshorten(
                           vim.fn.fnamemodify(vim.fn.getcwd(), ":~"), 4)
            end, 'filename'
        }
    },
    options = {theme = 'kanagawa'}
}
