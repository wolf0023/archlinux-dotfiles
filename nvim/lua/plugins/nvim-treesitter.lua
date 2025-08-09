return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "java",
                    "c",
                    "lua",
                    "vim",
                    "html",
                    "javascript",
                    "javadoc",
                    "markdown",
                },
                sync_install = false,
                highlight = {enable = true},
                indent = {enable = true},
            })
        end
    }
}
