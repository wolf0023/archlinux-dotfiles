return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                auto_integrations = true,
                transparent_background = true,
            })
        end
    }
}

