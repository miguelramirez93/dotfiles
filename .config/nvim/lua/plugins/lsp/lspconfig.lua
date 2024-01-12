return {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    dependencies = {
        { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
        { "folke/neodev.nvim",  opts = {} },
        "mason.nvim",
    },
    setup_servers = function(servers_list)
        for name, cfg in pairs(servers_list) do
            require('lspconfig')[name].setup(cfg)
        end
    end,
}
