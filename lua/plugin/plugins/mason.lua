return {
    "williamboman/mason.nvim",
    opts = {
        ui = {
            check_outdated_packages_on_open = true,
            border = "none",
            width = 0.8,
            height = 0.9,
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = ""
            },
            keymaps = {
                toggle_package_expand = "<CR>", --展开
                install_package = "I", --安装
                update_package = "R", --重新安装或更新
                check_package_version = "C", --检查更新
                update_all_packages = "U", --更新所有包
                check_outdated_packages = "c", --检查过时包
                uninstall_package = "D", --卸载
                cancel_installation = "<C-d>", --终止安装
                apply_language_filter = "<C-f>",
                toggle_package_install_log = "<CR>", --切换日志
                toggle_help = "g?", --帮助视图
            }
        }
    }
}
