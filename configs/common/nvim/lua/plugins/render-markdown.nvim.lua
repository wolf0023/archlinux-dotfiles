return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
            code = {
                style = 'language'
            },
            overrides = {
                buftype = {
                    nofile = {
                        code = {
                            language = false,
                            disable_background = true
                        }
                    }
                }
            }
        }
    }
}
