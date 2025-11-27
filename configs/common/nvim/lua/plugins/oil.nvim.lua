return {
    {
        'stevearc/oil.nvim',
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        "nvim-mini/mini.icons",
        opts = {},
    },
    {
        "benomahony/oil-git.nvim"
    }
}
