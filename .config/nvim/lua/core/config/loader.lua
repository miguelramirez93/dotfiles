local M = {}

--- Auto-require all .lua files in a config directory.
--- @param config_dir string Lua module path (e.g. "config")
function M.load(config_dir)
  local path = vim.fn.stdpath("config") .. "/lua/" .. config_dir:gsub("%.", "/")
  local files = vim.fn.glob(path .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
      require(config_dir .. "." .. name)
    end
  end
end

return M
