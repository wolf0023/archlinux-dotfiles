return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                inetegrations = {
                    auto_integrations = true,
                    mason = true,
                },
                transparent_background = true
            })
        end
    }
}

