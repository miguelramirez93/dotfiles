return {
  cmd = { "clojure-lsp" },
  filetypes = { "clojure", "clojurescript", "edn" },
  root_markers = { "deps.edn", "project.clj", "bb.edn", ".git" },
  init_options = {
    ["dependency-scheme"] = "jar",
  },
}
