return {
    ls = {
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
                        fieldalignment = true,
                        nilness = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    usePlaceholders = true,
                    completeUnimported = true,
                    staticcheck = true,
                    directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                    semanticTokens = true,
                },
            },
        },
    },
    deps = {
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
    },
    langs = {
        "go",
        "gomod",
        "gowork",
        "gosum",
    },
    formaters = {
        go = { "gofmt", "goimports" },
    },
    test_runners = {
        ["neotest-go"] = {
            experimental = {
                test_table = false,
            },
            args = { "-count=1", "-timeout=30s" },
        },
    },
}
