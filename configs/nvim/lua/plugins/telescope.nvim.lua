return {
    {
        "nvim-telescope/telescope.nvim", version = "*",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers"},
        },
        opt = {}
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    {
        "nvim-mini/mini.icons",
        version = false,
        config = function()
            require('mini.icons').setup()
            MiniIcons.mock_nvim_web_devicons()
        end,
    }
}
