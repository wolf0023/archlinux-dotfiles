return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                auto_integrations = true,
                float = {
                    solid = true
                },
            })
            -- テーマの設定
            vim.cmd.colorscheme "catppuccin"
        end
    }
}

