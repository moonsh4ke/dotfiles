local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmtalsp
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key


-- Options
ls.setup({
  history = true,
  update_events = {"TextChanged", "TextChangedI"},
})

-- vim.cmd[[set runtimepath+=~/.local/share/nvim/snippets]]
-- require("luasnip.loaders.from_vscode").lazy_load {
--     include = {"javascriptreact", "typescriptreact" },
-- }

-- Luasnip mappings
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-h>", function() ls.jump(-1) end, {silent = true})

-- vim.keymap.set({"i", "s"}, "<C-L>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/plugins/config/luasnip.lua<CR>")

-- Lua snippets
-- ls.add_snippets("all", {
--   s({trig="trigger"}, t("tasdf")),
--   -- s({trig="trigger"}, fmt("this is a fmt string {test}", {test = i(1, "example")})),
-- })

-- ls.add_snippets("javascriptreact", {
--   s({trig="rfc"}, t("react comp")),
-- })
