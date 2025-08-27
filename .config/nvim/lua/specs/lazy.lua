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
			lazy = false,
			version = false,
		},
		install = { colorscheme = { "habamax" } },
		checker = { enabled = true },
	})
end

return lazy

