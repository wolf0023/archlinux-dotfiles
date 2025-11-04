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
            popup_border_style = "rounded",
            source_selector = {
                winbar = true,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },

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
