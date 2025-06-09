return {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    keys = {
        { "<leader>co", "<cmd>ColorizerAttachToBuffer<CR>"},
    },
    opts = {
        'lua';
        'html';
        'css';
        'javascript';
        html = {
            mode = 'foreground';
        }
    },
}
-- #FFD700
-- #FFDE59
