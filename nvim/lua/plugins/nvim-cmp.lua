return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require('cmp')

            -- 補完の設定
            cmp.setup({
                -- スニペットを有効化
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                
                -- 補完ソースのリスト
                sources = cmp.config.sources({
                    {name = 'nvim_lsp'},
                    {name = 'vsnip'},
                    {name = 'buffer'},
                    {name = 'path'},
                }),
                -- キーマッピング
                mapping = cmp.mapping.preset.insert({
                    ["<S-TAB>"] = cmp.mapping.select_prev_item(),
                    ["<TAB>"] = cmp.mapping.select_next_item(),
                    ["<C-l>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({select = true}),
                }),
                experimental = {
                    ghost_text = true,
                },
            })
        end
    },
    {
        "hrsh7th/cmp-vsnip",
    },
    {
        "hrsh7th/vim-vsnip",
    },
}
