return {
    {
        "nvim-mini/mini.indentscope",
        version = false,
        opts = {
            symbol = "│",
            options = {try_as_border = true},
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lazy",
                    "help",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end
    }
}
