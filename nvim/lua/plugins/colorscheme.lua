return {
    {
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                flavour = "mocha",
                inetegrations = {
                    auto_integrations = true,
                }
            })
        end
    }
}

