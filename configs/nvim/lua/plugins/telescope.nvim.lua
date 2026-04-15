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
        "nvim-tree/nvim-web-devicons",
        opt = {}
    }
}
