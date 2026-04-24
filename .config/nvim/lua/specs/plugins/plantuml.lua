return {
  {
    "aklt/plantuml-syntax",
    ft = "plantuml",
  },
  {
    "weirongxu/plantuml-previewer.vim",
    ft = "plantuml",
    dependencies = { "tyru/open-browser.vim" },
    keys = {
      { "<leader>pp", "<cmd>PlantumlOpen<cr>", ft = "plantuml", desc = "Preview PlantUML" },
    },
  },
}
