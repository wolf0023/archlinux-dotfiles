return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            panel = { enabled = false },
            suggestion = {
                keymap = {
                    accept = false,
                    next = false,
                    prev = false,
                    dismiss = false,
                }
            }
        }
    },
    {
        "zbirenbaum/copilot-cmp",
        opts = {}
    }
}
