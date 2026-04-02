return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    icon_enabled = true,
                    theme = "catppuccin-nvim",
                    globalstatus = true,
                    extensions = {"lazy", "oil", "mason"},
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { { 'mode', separator = { left = '', right = '' }, right_padding = 2 } },
                    lualine_b = { 'filename', 'branch' },
                    lualine_c = {
                        '%=', --[[ add your center components here in place of this comment ]]
                    },
                    lualine_x = { { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } } },
                    lualine_y = { 'filetype', 'progress' },
                    lualine_z = {
                        { 'location', separator = { left = '', right = '', left_padding = 2 } },
                    },
                },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'location' },
                },
            })
	    end
    },
    {
        "nvim-tree/nvim-web-devicons",
    }
}
