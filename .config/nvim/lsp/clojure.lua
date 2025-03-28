return {
  cmd = { vim.env.MASON .. "/bin/clojure-lsp" },
  filetypes = { "clojure", "edn" },
  root_markers = { "project.clj", "deps.edn", ".git", "bb.edn" },
  single_file_support = true
}
