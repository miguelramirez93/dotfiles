local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true } )
end

vim.g.mapleader = ' '



mapper("n", "<C-t>", ":tabnew<CR>")
mapper("n", "<C-s>", ":w<CR>")
-- COC
--mapper("n", "K", ":call CocAction('doHover')<CR>")
--mapper("n", "gd", "<Plug>(coc-definition)")
--mapper("n", "gv", ":call CocAction('jumpDefinition', 'vsplit')<CR>")
--mapper("n", "gy", "<Plug>(coc-type-definition)")
--mapper("n", "gr", "<Plug>(coc-references)")
--mapper("n", "ca", "<Plug>(coc-codeaction)")
--mapper("n", "rn", "<Plug>(coc-rename)")
--vim.cmd[[
--    inoremap <silent><expr> <c-space> coc#refresh()
--]]

mapper("v", "<", "<gv")
mapper("v", ">", ">gv")


mapper("n", "<C-p>", ":Telescope find_files<CR>")
mapper("n", "<C-f>", ":Telescope live_grep<CR>")

-- Nvimtree
mapper("n", "<C-b>", ":NvimTreeToggle<CR>")