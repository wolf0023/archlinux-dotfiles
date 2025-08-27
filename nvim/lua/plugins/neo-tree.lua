return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        opts = {
            close_if_last_window = true,
            window = {
                width = 30,
            },
            add_blank_line_at_top = true,
        }
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "MunifTanjim/nui.nvim"
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "antosha417/nvim-lsp-file-operations",
        config = function()
            require("lsp-file-operations").setup()
        end
    }
}
