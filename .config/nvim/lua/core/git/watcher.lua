local M = {}

local branch = ""
local fs_branch_watcher = nil
local watching_branch = false

local changes = { added = 0, modified = 0, deleted = 0 }
local fs_index_watcher = nil
local watching_changes = false

local function get_git_dir()
  local handle = io.popen("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse --git-dir 2>/dev/null")
  if handle then
    local result = handle:read("*l")
    handle:close()
    return result
  end
  return nil
end

-- Branch

local function read_branch()
  local git_dir = get_git_dir()
  if not git_dir then
    branch = ""
    return
  end

  local head_file = git_dir .. "/HEAD"
  local f = io.open(head_file, "r")
  if f then
    local content = f:read("*l")
    f:close()
    branch = content and content:match("ref: refs/heads/(.+)") or content:sub(1, 8) or ""
  else
    branch = ""
  end
end

local function watch_git_head()
  if fs_branch_watcher then
    fs_branch_watcher:stop()
    fs_branch_watcher = nil
  end

  local git_dir = get_git_dir()
  if not git_dir then
    return
  end

  local head_file = git_dir .. "/HEAD"
  fs_branch_watcher = vim.uv.new_fs_event()
  fs_branch_watcher:start(
    head_file,
    {},
    vim.schedule_wrap(function()
      read_branch()
      vim.cmd("redrawstatus")
      watch_git_head()
    end)
  )
end

-- Changes

local function read_changes()
  local added, modified, deleted = 0, 0, 0
  local handle = io.popen("git -C " .. vim.fn.expand("%:p:h") .. " status --porcelain 2>/dev/null")
  if handle then
    for line in handle:lines() do
      local xy = line:sub(1, 2)
      if xy:match("^%?%?") then
        added = added + 1
      elseif xy:match("^.D") or xy:match("^D.") then
        deleted = deleted + 1
      else
        modified = modified + 1
      end
    end
    handle:close()
  end
  changes = { added = added, modified = modified, deleted = deleted }
end

local function watch_git_index()
  if fs_index_watcher then
    fs_index_watcher:stop()
    fs_index_watcher = nil
  end

  local git_dir = get_git_dir()
  if not git_dir then
    return
  end

  local index_file = git_dir .. "/index"
  fs_index_watcher = vim.uv.new_fs_event()
  fs_index_watcher:start(
    index_file,
    {},
    vim.schedule_wrap(function()
      read_changes()
      vim.cmd("redrawstatus")
      watch_git_index()
    end)
  )
end

-- Public API

function M.branch()
  return branch
end

function M.changes()
  return changes
end

function M.watch_branch()
  if watching_branch then
    return
  end
  watching_branch = true

  read_branch()
  watch_git_head()

  vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
    callback = function()
      read_branch()
      watch_git_head()
    end,
  })
end

function M.watch_changes()
  if watching_changes then
    return
  end
  watching_changes = true

  read_changes()
  watch_git_index()

  vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "DirChanged" }, {
    callback = function()
      read_changes()
      watch_git_index()
    end,
  })
end

return M
