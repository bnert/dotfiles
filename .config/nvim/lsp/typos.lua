return {
  cmd = { vim.env.MASON .. "/bin/typos-lsp" },
  root_markers = { ".git", "typos.toml", "_typos.toml", ".typos.toml" },
  single_file_support = true
}
