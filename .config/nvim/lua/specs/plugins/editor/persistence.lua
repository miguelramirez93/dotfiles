--[[ vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    callback = function()
        if vim.fn.getcwd() ~= vim.env.HOME then
            require("persistence").load()
        end
    end,
    nested = true,
}) ]]
vim.api.nvim_create_user_command("RestorePrevSession", function()
    if vim.fn.getcwd() ~= vim.env.HOME then
        require("persistence").load()
    end
end, {})
return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
        -- add any custom options here
    }
}
