vim.api.nvim_create_user_command("StartLs",
    function()
        vim.lsp.start({
            name = 'jdtls',
            cmd = {'jdtls'},
            root_dir = vim.fs.dirname(vim.fs.find({"",""}, { upward = true })[1]),
        })
    end,{}
    )
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set("n", "K", vim.lsp.buf.hover(), { buffer = args.buf })
  end,
})



_G.StartLs = "StartLs"
-- root_dir :表示项目的根目录的路径,语言服务器会使用这个目录作为查找和分析你的代码的起点
-- upward = true :向上级目录搜索，直到找到符合条件的文件
