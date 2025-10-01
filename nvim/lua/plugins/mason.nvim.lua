return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {}
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
        -- 診断メッセージの表示設定
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
            -- ホバー時に診断メッセージを表示
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    vim.diagnostic.open_float({
                        border = 'rounded',
                        focusable = false,
                        source = 'always',
                        scope = 'cursor',
                        header = '',
                        prefix = ' ',
                        close_events = {
                            'CursorMoved',
                            'InsertEnter',
                            'FocusLost',
                            'BufLeave',
                        }
                    })
                end
            })
        end
    }
}
