return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ["*"] = {
        keys = {
          { "gv", ":vsplit | lua vim.lsp.buf.definition()<CR>" },
        },
      },
      gopls = {
        settings = {
          gopls = {
            gofumpt = false,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
              unreachable = false,
              unusedvariable = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = false,
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
            hint = {
              enable = true,
            },
          },
        },
      },
      jsonls = {},
      marksman = {},
      ts_ls = {
        settings = {
          tsserver = {
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            rootMarkers = { "package.json", "tsconfig.json", "jsconfig.json" },
            logVerbosity = "normal",
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace",
            },
          },
        },
      },
      ruff = {},
      clojure_lsp = {},
      pylsp = {},
      dartls = {},
    },
  },
}
