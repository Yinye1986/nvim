vim.cmd[[
    autocmd BufRead,BufNewFile *.java luafile ~/.config/nvim/lua/lsp/lspConfigs/javals.lua
]]
vim.cmd[[
    autocmd BufRead,BufNewFile *.lua luafile ~/.config/nvim/lua/lsp/lspConfigs/luals.lua
]]

vim.keymap.set('n', "sl", ':lua vim.cmd(_G.StartLs)<CR>', {noremap = true})
