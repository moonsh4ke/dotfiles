-- Treesitter

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = false,
    -- additional_vim_regex_highlighting=true,
    -- disable = {"javascript, javascriptreact", "markdown"}
  },
  indent = {
    enable = false,
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
