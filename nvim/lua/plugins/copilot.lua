return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true
                },
                panel = {enabled = true}
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    }
}
