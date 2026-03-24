return {
    {
        "nvim-lualine/lualine.nvim",
    	config = function()
		    require("lualine").setup({
                options = {
                    icon_enabled = true,
                    theme = "catppuccin",
                    globalstatus = true,
                    extensions = {"lazy", "oil", "mason"},
                }
            })
	    end
    },
    {
        "nvim-tree/nvim-web-devicons",
    }
}
