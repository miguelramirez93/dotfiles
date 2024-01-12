return {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#6272A4", guifg = "#F8F8F2" },
            InclineNormalNC = { guifg = "#6272A4", guibg = "#F8F8F2" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local modified = { " " }
          if vim.bo[props.buf].modified then
            modified = { " ● ", guifg = "#FF5555" }
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename }, modified }
        end,
      })
    end,
  }