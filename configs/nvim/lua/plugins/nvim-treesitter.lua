return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",

        config = function()
            -- List of languages to install parsers for
            local LANGUAGES = {
                "rust",
                "python",
                "javascript",
                "typescript",
                "go",
                "java",
                "cpp",
                "html",
                "css",
                "json",
                "yaml",
            }

            require("nvim-treesitter").install(LANGUAGES)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = LANGUAGES,

                callback = function()
                    -- Highlighting
                    vim.treesitter.start()
                    -- Indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            })
        end
    }
}
