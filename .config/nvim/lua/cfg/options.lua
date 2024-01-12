local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.timeoutlen = 300
opt.tabstop = 2
opt.shiftwidth = 2
opt.splitright = true
opt.cursorline = true
opt.updatetime=500

vim.diagnostic.config({
    virtual_text = false,
})

vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])
