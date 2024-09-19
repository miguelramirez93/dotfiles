local lazy = {
	enable_lazy_load = true,
}
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

function lazy.install()
	if not vim.loop.fs_stat(lazypath) then
		-- bootstrap lazy.nvim
		-- stylua: ignore
		vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
			lazypath })
	end
	vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
end

function lazy.sync(plugins_list)
	local plugs = plugins_list

	if not lazy.enable_lazy_load then
		for _, plug in ipairs(plugs) do
			plug.event = nil
			plug.lazy = false
		end
	end

	require("lazy").setup({
		spec = plugs,
		defaults = {
			-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
			-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
			lazy = false,
			-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
			-- have outdated releases, which may break your Neovim install.
			version = false, -- always use the latest git commit
			-- version = "*", -- try installing the latest stable version for plugins that support semver
		},
		install = { colorscheme = { "habamax" } },
		checker = { enabled = true }, -- automatically check for plugin updates
		-- performance = {
		-- 	rtp = {
		-- 		-- disable some rtp plugins
		-- 		disabled_plugins = {
		-- 			"gzip",
		-- 			-- "matchit",
		-- 			-- "matchparen",
		-- 			-- "netrwPlugin",
		-- 			"tarPlugin",
		-- 			"tohtml",
		-- 			"tutor",
		-- 			"zipPlugin",
		-- 		},
		-- 	},
		-- },
	})
end

return lazy
