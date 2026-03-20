return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- go
      "gopls",
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "delve",
      "gotests",
      "golangci-lint",
      "golines",
      "goimports-reviser",
      --lua
      "stylua",
      "shfmt",
      "lua-language-server",
      --json
      "json-lsp",
      --md
      "markdownlint",
      "marksman",
      --jscript/typescript
      "typescript-language-server",
      "prettierd",
      "prettier",
      --python
      "python-lsp-server",
      "jinja-lsp",
      "pylint",
      "autopep8",
      -- clojure
      "clojure-lsp",
      "cljfmt",
      "clj-kondo",
      --dart
      "dcm",
    },
  },
}
