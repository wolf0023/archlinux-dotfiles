return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                auto_integrations = true,
                transparent_background = true,
                float = {
                    transparent = true,
                },
            })
            -- テーマの設定
            vim.cmd.colorscheme "catppuccin"
        end
    }
}

