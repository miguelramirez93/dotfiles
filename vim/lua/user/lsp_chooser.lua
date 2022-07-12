local globals = require("user.globals")
local files = require("user.utils.files")

local function use_native()
    require "user.cmp"
    require "user.lsp"
    require "user.autopairs"
    require "user.trouble"
end

local function use_coc()
    require "user.coc"
end

local M = {}

function M.get_config_file_path()
  return os.getenv("HOME").."/.nvim_config"
end

function M.sync_packager()
  local config_file = files.read_or_create(M.get_config_file_path())

  local config_lsp_val = config_file:read("l")
  config_file:close()
  local should_sync = config_lsp_val ~= globals.lsp_client

  if should_sync then
      require("packer").sync()
      config_file = files.read(M.get_config_file_path())
      config_file:write(globals.lsp_client)
      config_file:close()
  end
end


function M.setup()
  if globals.lsp_client == globals.native then
    use_native()
  else 
      use_coc()
  end

  M.sync_packager()
end

return M
