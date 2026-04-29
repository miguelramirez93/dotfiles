local M = {}

--- LSP server lifecycle states.
--- Transitions: REGISTERED -> ENABLED -> ATTACHED -> ENABLED (on detach).
M.STATE = {
  REGISTERED = "registered",
  ENABLED = "enabled",
  ATTACHED = "attached",
}

local servers_dir = nil
local server_states = {}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client then
      server_states[client.name] = M.STATE.ATTACHED
    end
  end,
})

vim.api.nvim_create_autocmd("LspDetach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and server_states[client.name] then
      server_states[client.name] = M.STATE.ENABLED
    end
  end,
})

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
      server_states[name] = M.STATE.REGISTERED

      local filetypes = config.filetypes or {}
      if #filetypes > 0 then
        vim.api.nvim_create_autocmd("FileType", {
          pattern = filetypes,
          once = true,
          callback = function()
            if server_states[name] ~= M.STATE.ENABLED and server_states[name] ~= M.STATE.ATTACHED then
              server_states[name] = M.STATE.ENABLED
              vim.lsp.enable(name)
              vim.schedule(function()
                vim.api.nvim_exec_autocmds("User", { pattern = "LspLoading" })
              end)
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

--- Return a table of server_name -> state.
--- @return table<string, string>
function M.status()
  return server_states
end

--- Return names of currently attached servers.
--- @return string[]
function M.attached()
  local result = {}
  for name, state in pairs(server_states) do
    if state == M.STATE.ATTACHED then
      table.insert(result, name)
    end
  end
  return result
end

return M
