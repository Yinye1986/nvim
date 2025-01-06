return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "c", "cpp", "markdown", "bash", "cmake", "make", "lua" },
            sync_install = true,

            auto_install = false,
            ignore_install = {},

            highlight = {
                enable = true,
            },
            indent ={
                enable = false,
            },
            fold = {
                enable = true,  -- Make sure this is enabled
            },
        }
    end
}
