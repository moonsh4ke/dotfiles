-- Treesitter

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"javascript", "markdown"}
  },
  indent = {
    enable = true,
    disable = {"javascript"}
  },
  autotag = {
    enable = true,
    map_cr = true
  },
  -- context_commentstring = {
    --     enable = true,
    --     config = {
    --         javascript = {
    --             __default = '// %s',
    --             jsx_element = '{/* %s */}',
    --             jsx_fragment = '{/* %s */}',
    --             jsx_attribute = '// %s',
    --             comment = '// %s'
    --         }
    --     }
    -- }
}
