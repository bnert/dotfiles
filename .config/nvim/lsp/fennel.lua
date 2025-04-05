return {
  cmd = { vim.env.MASON .. "/bin/fennel-ls" },
  filetypes = { "fennel" },
  root_markers = { "flsproject.fnl", ".git"  },
  single_file_support = true,
}
