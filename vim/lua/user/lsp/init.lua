local requ = require('user.utils.requirement')

local lsp_conf_installed = requ.installed("lspconfig")

if not lsp_conf_installed then
  return
end

local lsp_signature_installed = requ.installed("lsp_signature")

if not lsp_signature_installed then
  return
end


require("user.lsp.keymaps").setup()

require("user.lsp.settings").setup()

require("user.lsp.null-ls")
