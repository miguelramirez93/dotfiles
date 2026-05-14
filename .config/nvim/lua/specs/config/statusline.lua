vim.o.laststatus = 3

local git = require("core.git.watcher")
local lsp = require("core.lsp.loader")
git.watch_branch()
git.watch_changes()

local hl_sources = {
  StatusModeNormal = "Function",
  StatusModeInsert = "String",
  StatusModeVisual = "Statement",
  StatusModeReplace = "DiagnosticError",
  StatusModeCommand = "DiagnosticWarn",
  StatusModeTerminal = "Type",
  StatusBranch = "Keyword",
  StatusPath = "Function",
  StatusLspAttached = "Type",
  StatusLspLoading = "Constant",
  StatusProgress = "Comment",
}

local mode_map = {
  ["n"] = { label = "NORMAL", group = "StatusModeNormal" },
  ["no"] = { label = "O-PEND", group = "StatusModeNormal" },
  ["i"] = { label = "INSERT", group = "StatusModeInsert" },
  ["ic"] = { label = "INSERT", group = "StatusModeInsert" },
  ["v"] = { label = "VISUAL", group = "StatusModeVisual" },
  ["V"] = { label = "V-LINE", group = "StatusModeVisual" },
  ["\22"] = { label = "V-BLOCK", group = "StatusModeVisual" },
  ["s"] = { label = "SELECT", group = "StatusModeVisual" },
  ["S"] = { label = "S-LINE", group = "StatusModeVisual" },
  ["\19"] = { label = "S-BLOCK", group = "StatusModeVisual" },
  ["R"] = { label = "REPLACE", group = "StatusModeReplace" },
  ["Rv"] = { label = "V-REPL", group = "StatusModeReplace" },
  ["c"] = { label = "COMMAND", group = "StatusModeCommand" },
  ["cv"] = { label = "EX", group = "StatusModeCommand" },
  ["r"] = { label = "PROMPT", group = "StatusModeCommand" },
  ["t"] = { label = "TERM", group = "StatusModeTerminal" },
}

local text_only = { StatusPath = true }

local function hl_attr(group, attr)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  return hl[attr]
end

local function setup_highlights()
  local text_color = hl_attr("StatusLine", "bg") or hl_attr("Normal", "bg") or 0x000000
  for group, source in pairs(hl_sources) do
    local accent = hl_attr(source, "fg")
    if accent then
      if text_only[group] then
        vim.api.nvim_set_hl(0, group, { fg = accent })
      else
        vim.api.nvim_set_hl(0, group, { fg = text_color, bg = accent })
      end
    end
  end
end

setup_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = setup_highlights,
})

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

vim.api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

local function colorize(group, text)
  return "%#" .. group .. "#" .. text .. "%*"
end

local function section(group, content)
  return colorize(group, " " .. content .. " ")
end

function _G.custom_statusline()
  local pieces = {}

  local mode_char = vim.api.nvim_get_mode().mode
  local mode = mode_map[mode_char] or { label = mode_char:upper(), group = "StatusModeNormal" }
  table.insert(pieces, section(mode.group, mode.label))

  local branch = git.branch()
  local c = git.changes()
  if branch ~= "" or c.added > 0 or c.modified > 0 or c.deleted > 0 then
    local parts = {}
    if branch ~= "" then
      local branch_icon = vim.fn.nr2char(0xe725)
      table.insert(parts, branch_icon .. " " .. branch)
    end
    if c.added > 0 then
      local icon_added = vim.fn.nr2char(0xf055)
      table.insert(parts, icon_added .. " " .. c.added)
    end
    if c.modified > 0 then
      local icon_modified = vim.fn.nr2char(0xf040)
      table.insert(parts, icon_modified .. " " .. c.modified)
    end
    if c.deleted > 0 then
      local icon_deleted = vim.fn.nr2char(0xf056)
      table.insert(parts, icon_deleted .. " " .. c.deleted)
    end
    table.insert(pieces, section("StatusBranch", table.concat(parts, " ")))
  end

  local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:h")
  if path == "" or path == "." then
    path = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
  end
  local folder_icon = vim.fn.nr2char(0xf07c)
  table.insert(pieces, section("StatusPath", folder_icon .. " " .. path))

  local left = table.concat(pieces, "")

  local right_pieces = {}
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
    table.insert(right_pieces, section("StatusLspAttached", lsp_icon .. " " .. table.concat(attached, ", ")))
  end
  if #loading > 0 then
    table.insert(
      right_pieces,
      section("StatusLspLoading", spinner_frames[spinner_idx] .. " " .. table.concat(loading, ", "))
    )
  end

  local progress_icon = vim.fn.nr2char(0xf0d8)
  table.insert(right_pieces, section("StatusProgress", progress_icon .. " %p%%"))

  local right = table.concat(right_pieces, "")

  return left .. "%=" .. right
end

vim.o.statusline = "%!v:lua.custom_statusline()"
