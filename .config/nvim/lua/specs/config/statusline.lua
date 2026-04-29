vim.o.laststatus = 3

local git = require("core.git.watcher")
local lsp = require("core.lsp.loader")
git.watch_branch()
git.watch_changes()

local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_idx = 1
local spinner_timer = nil

local function start_spinner()
  if spinner_timer then
    return
  end
  spinner_timer = vim.uv.new_timer()
  spinner_timer:start(
    0,
    80,
    vim.schedule_wrap(function()
      spinner_idx = (spinner_idx % #spinner_frames) + 1
      vim.cmd("redrawstatus")

      local has_loading = false
      for _, state in pairs(lsp.status()) do
        if state == lsp.STATE.ENABLED then
          has_loading = true
          break
        end
      end
      if not has_loading and spinner_timer then
        spinner_timer:stop()
        spinner_timer:close()
        spinner_timer = nil
      end
    end)
  )
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LspLoading",
  callback = start_spinner,
})

vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
  callback = function()
    vim.schedule(function()
      vim.cmd("redrawstatus")
    end)
  end,
})

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
    if c.added > 0 then
      table.insert(parts, icon_added .. " " .. c.added)
    end
    if c.modified > 0 then
      table.insert(parts, icon_modified .. " " .. c.modified)
    end
    if c.deleted > 0 then
      table.insert(parts, icon_deleted .. " " .. c.deleted)
    end
    left = left .. "  " .. table.concat(parts, " ")
  end

  local lsp_section = ""
  local status = lsp.status()
  local attached = {}
  local loading = {}
  for name, state in pairs(status) do
    if state == lsp.STATE.ATTACHED then
      table.insert(attached, name)
    elseif state == lsp.STATE.ENABLED then
      table.insert(loading, name)
    end
  end

  local lsp_icon = vim.fn.nr2char(0xf085)
  if #attached > 0 then
    lsp_section = lsp_icon .. " " .. table.concat(attached, ", ") .. "  "
  end
  if #loading > 0 then
    lsp_section = lsp_section .. spinner_frames[spinner_idx] .. " " .. table.concat(loading, ", ") .. "  "
  end

  local progress_icon = vim.fn.nr2char(0xf0d8)
  local right = lsp_section .. progress_icon .. " %p%% "

  return left .. "%=" .. right
end

vim.o.statusline = "%!v:lua.custom_statusline()"
