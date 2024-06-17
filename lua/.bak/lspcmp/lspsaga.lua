return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        "neovim/nvim-lspconfig",
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local nvim_lspconfig = require('lspconfig')
        -- Use an LspAttach function to only map the following keys
        -- after the language server attaches to the current buffer
        local LspAttach = function(client, bufnr)
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local opts = { noremap = true, silent = true }
            -- 跳转到声明
            buf_set_keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
            -- 跳转到定义
            buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            -- 显示注释文档
            buf_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
            -- 跳转到实现
            buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
            -- 跳转到引用位
            buf_set_keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
            -- 以浮窗形式显
            buf_set_keymap("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
            buf_set_keymap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
            buf_set_keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
            buf_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
            buf_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
            buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
            buf_set_keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
        end

        -- Use a loop to conveniently call 'setup' on multiple servers and
        -- map buffer local keybindings when the language server attaches
        local servers = { "jdtls", "lua_ls", "clangd" }
        for _, lsp in ipairs(servers) do
            nvim_lspconfig[lsp].setup({
                LspAttach = LspAttach,
                flags = {
                    debounce_text_changes = 150,
                }
            })
        end
    end
}
--             -- Mappings.
--             local opts = { noremap=true, silent=true }
--             buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--             buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--             buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--             buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--             buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--             buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--             buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--             buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--             buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--             buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--             buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--             buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--             buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--             buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--             buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--             buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--             buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
