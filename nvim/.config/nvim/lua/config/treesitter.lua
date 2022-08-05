-- Treesitter

require('nvim-treesitter.install').update({ with_sync = true })

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {"javascript", "markdown"}
    }
--     context_commentstring = {
--         enable = true,
--         config = {
--             javascript = {
--                 __default = '// %s',
--                 jsx_element = '{/* %s */}',
--                 jsx_fragment = '{/* %s */}',
--                 jsx_attribute = '// %s',
--                 comment = '// %s'
--             }
--         }
--     }
}
