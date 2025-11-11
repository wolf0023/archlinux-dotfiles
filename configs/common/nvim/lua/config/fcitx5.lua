-- Fcitx5 input method handling for Neovim
-- Citation: https://qiita.com/keith_campbell/items/6787dca658a3c9460bca
local function trim(s)
    return s:match("^%s*(.-)%s*$")
end

local function GetFcitxStatus()
    local handle = io.popen('fcitx5-remote -n')
    local result = handle:read("*a")
    handle:close()
    return trim(result)
end

local function OnInsertLeave()
    -- Save fcitx status when leaving insert mode
    vim.g.fcitx_status = GetFcitxStatus()
    -- Disable (Japanese) input method 
    os.execute('fcitx5-remote -c')
end

local function Enable(status)
    if status ~= 'keyboard-us' then
        os.execute('fcitx5-remote -o')
    end
end

vim.g.fcitx_status = GetFcitxStatus()

-- Autocmd for InsertLeave and InsertEnter
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = OnInsertLeave
})
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        Enable(vim.g.fcitx_status)
    end
})

