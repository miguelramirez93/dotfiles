--- @class PluginManager
--- @field bootstrap fun() Install the manager if not present
--- @field setup fun(plugins_dir: string) Load plugin specs and configure

local M = {}

--- Load a plugin manager by name.
--- @param name string Manager module name (e.g. "lazy")
--- @param plugins_dir string Lua module path for plugins (e.g. "plugins")
--- @return nil
function M.load(name, plugins_dir)
  local ok, manager = pcall(require, "specs.p_managers." .. name)
  if not ok then
    error(string.format('Plugin manager "%s" not found in specs/p_managers/', name))
  end

  assert(type(manager.bootstrap) == "function", string.format('Manager "%s" missing bootstrap()', name))
  assert(type(manager.setup) == "function", string.format('Manager "%s" missing setup()', name))

  manager.bootstrap()
  manager.setup(plugins_dir)
end

return M
