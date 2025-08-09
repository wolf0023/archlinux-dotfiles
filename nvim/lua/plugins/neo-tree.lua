return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        lazy = false,
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    width = 30,
                },
            })
        end,
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
}
