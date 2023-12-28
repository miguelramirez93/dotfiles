-- Commands
vim.api.nvim_create_user_command("TestCurrentFile", function()
  require("neotest").run.run(vim.fn.expand("%"))
  require("neotest").summary.toggle()
end, {})

vim.api.nvim_create_user_command("TestFunc", function()
  require("neotest").run.run()
end, {})

vim.api.nvim_create_user_command("TestAll", function()
  require("neotest").run.run(vim.fn.getcwd())
  require("neotest").summary.toggle()
end, {})

vim.api.nvim_create_user_command("TestCurrResult", function()
  require("neotest").output.open({ enter = true })
end, {})

-- test runner cfg
return {
  {
    "nvim-neotest/neotest-go",
  },
  { "nvim-neotest/neotest-plenary" },
  { "andy-bell101/neotest-java" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        "neotest-plenary",
        ["neotest-go"] = {
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=30s" },
        },
        "neotest-java",
      },
    },
  },
}
