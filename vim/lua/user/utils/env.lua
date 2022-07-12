local M = {}

function M.get(name, default_val)
  local env_var_value = os.getenv(name) 
  if env_var_value == nil then
    return default_val
  end
  return env_var_value
end

return M
