local M = {}

local loaded = {}
local servers_dir = nil

local function scan_names()
  local path = vim.fn.stdpath("config") .. "/lua/" .. servers_dir:gsub("%.", "/")
  local files = vim.fn.glob(path .. "/*.lua", false, true)
  local names = {}

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
      table.insert(names, name)
    end
  end

  return names
end

--- Scan a servers directory and configure each LSP server.
--- Servers are enabled only when a matching filetype is opened.
--- @param dir string Lua module path (e.g. "specs.servers")
function M.load(dir)
  servers_dir = dir

  for _, name in ipairs(scan_names()) do
    local ok, config = pcall(require, servers_dir .. "." .. name)
    if ok and config then
      vim.lsp.config(name, config)

      local filetypes = config.filetypes or {}
      if #filetypes > 0 then
        vim.api.nvim_create_autocmd("FileType", {
          pattern = filetypes,
          once = true,
          callback = function()
            if not loaded[name] then
              loaded[name] = true
              vim.lsp.enable(name)
            end
          end,
        })
      end
    end
  end
end

--- Return the list of server names from the loaded directory.
--- @return string[]
function M.list()
  return scan_names()
end

return M
