return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            cmdline = {
                view = "cmdline",
            },
            messages = {
                view = "mini",
                view_error = "mini",
                view_warn = "mini",
            },
            routes = {
                {
                    view = "mini",
                    filter = { event = "msg_showmode" },
                },
            },
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                }
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                lsp_doc_border = true,
            },
        },
    },
    {
        "MunifTanjim/nui.nvim",
    },
}
