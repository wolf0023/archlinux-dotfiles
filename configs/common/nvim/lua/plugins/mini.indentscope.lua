return {
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            require("mini.indentscope").setup({
                symbol = "│",
                options = {try_as_border = true},
            })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lazy",
                    "help",
                    "neo-tree"
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end
    }
}
