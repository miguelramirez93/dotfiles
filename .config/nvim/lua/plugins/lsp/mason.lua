local opts = {
    ensure_installed = {},
}

return {
    "williamboman/mason.nvim",
    lazy = false,
    install_deps = function(deps)
        vim.list_extend(opts.ensure_installed, deps)
        require("mason").setup(opts)
        for _, dep in ipairs(deps) do
            if not require("mason-registry").is_installed(dep) then
                vim.cmd { cmd = 'MasonInstall', args = { dep } }
            end
        end
    end
}
