return {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    enabled = false,
    config = function()
      --local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#44475A", guifg = "#F8F8F2" },
            InclineNormalNC = { guifg = "#6272A4", guibg = "#F8F8F2" },
          },
        --[[   groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					}, ]]
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
          --return {{ filename }, modified }
        end,
      })
    end,
  }