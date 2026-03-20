return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- LazyVim config for treesitter
    indent = { enable = true }, ---@type lazyvim.TSFeat
    highlight = { enable = true }, ---@type lazyvim.TSFeat
    folds = { enable = true }, ---@type lazyvim.TSFeat
    ensure_installed = {
      --go
      "go",
      "gomod",
      "gowork",
      "gosum",
      --lua
      "lua",
      "vimdoc",
      "regex",
      --json
      "jsonc",
      --md
      "markdown_inline",
      "markdown",
      --jscript/typescript
      "javascript",
      "typescript",
      "tsx",
      --python
      "python",
      "ninja",
      "rst",
      --clojure
      "clojure",
      --dart
      "dart",
      --default
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },
}
