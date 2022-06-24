local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true } )
end

vim.g.mapleader = ' '



mapper("n", "<C-t>", ":tabnew<CR>")
mapper("n", "<C-s>", ":w<CR>")


mapper("v", "<", "<gv")
mapper("v", ">", ">gv")


mapper("n", "<C-p>", ":Telescope find_files<CR>")
mapper("n", "<C-f>", ":Telescope live_grep<CR>")

-- Nvimtree
mapper("n", "<C-b>", ":NvimTreeToggle<CR>")
