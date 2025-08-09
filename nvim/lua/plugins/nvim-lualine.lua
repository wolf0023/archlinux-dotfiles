return {
    {
        "nvim-lualine/lualine.nvim",
    	config = function()
		    require("lualine").setup({
                options = {
                    icon_enabled = true,
                    theme = "catppuccin",
                    globalstatus = true,
                    extensions = {"lazy", "neo-tree"},
                }
            })
	    end
    },
    {
        "nvim-tree/nvim-web-devicons",
    }
}
