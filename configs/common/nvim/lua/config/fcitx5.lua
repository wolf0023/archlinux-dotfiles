-- Vim のモードが挿入モード以外のときに fcitx5 を無効化する
vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained", "InsertLeave", "ModeChanged" }, {
    pattern = "*",
    callback = function()
        local mode = vim.fn.mode()
        if mode ~= "i" then
            vim.fn.system("fcitx5-remote -c")
        end
    end,
})
