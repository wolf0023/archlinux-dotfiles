return {
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
                highlights = require("catppuccin.groups.integrations.bufferline").get()
            })
		end
	},
	{
		"nvim-tree/nvim-web-devicons"
	}
}
