return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        require("ibl").setup()
    end,
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}
