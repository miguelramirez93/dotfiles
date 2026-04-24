vim.o.laststatus = 3

local git = require("core.git.watcher")
git.watch_branch()
git.watch_changes()

function _G.custom_statusline()
  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:h")
  if path == "" or path == "." then
    path = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
  end

  local folder_icon = vim.fn.nr2char(0xf07c)
  local left = " " .. folder_icon .. " " .. path

  local branch = git.branch()
  if branch ~= "" then
    local branch_icon = vim.fn.nr2char(0xe725)
    left = left .. "  " .. branch_icon .. " " .. branch
  end

  local c = git.changes()
  if c.added > 0 or c.modified > 0 or c.deleted > 0 then
    local parts = {}
    local icon_added = vim.fn.nr2char(0xf055)
    local icon_modified = vim.fn.nr2char(0xf040)
    local icon_deleted = vim.fn.nr2char(0xf056)
    if c.added > 0 then table.insert(parts, icon_added .. " " .. c.added) end
    if c.modified > 0 then table.insert(parts, icon_modified .. " " .. c.modified) end
    if c.deleted > 0 then table.insert(parts, icon_deleted .. " " .. c.deleted) end
    left = left .. "  " .. table.concat(parts, " ")
  end

  local progress_icon = vim.fn.nr2char(0xf0d8)
  local right = progress_icon .. " %p%% "

  return left .. "%=" .. right
end

vim.o.statusline = "%!v:lua.custom_statusline()"
