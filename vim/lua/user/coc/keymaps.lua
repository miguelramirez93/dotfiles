--TODO make this function global cause is used in different modules
local mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true } )
end

-- COC
mapper("n", "K", ":call CocAction('doHover')<CR>")
mapper("n", "gd", "<Plug>(coc-definition)")
mapper("n", "gv", ":call CocAction('jumpDefinition', 'vsplit')<CR>")
mapper("n", "gy", "<Plug>(coc-type-definition)")
mapper("n", "gr", "<Plug>(coc-references)")
mapper("n", "ca", "<Plug>(coc-codeaction)")
mapper("n", "rn", "<Plug>(coc-rename)")
vim.cmd[[
    inoremap <silent><expr> <c-space> coc#refresh()
]]
