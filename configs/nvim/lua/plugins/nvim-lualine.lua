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
                    lualine_a = { { 'mode', separator = { left = '', right = '' } } },
                    lualine_b = { 'location', 'progress' },
                    lualine_c = { 'branch', { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } } },
                    lualine_x = {},
                    lualine_y = { 'encoding', 'filetype' },
                    lualine_z = {
                        { 'filename', separator = { left = '', right = ''} },
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
