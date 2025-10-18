local filetypes = {
  "javascript",
  "javascriptreact",
  "javascript.jsx",
  "typescript",
  "typescriptreact",
  "typescript.tsx",
  -- "vue",
  -- "svelte",
  -- "astro",
}

return {
  cmd = { "typescript-language-server", "--stdio" },
  init_options = { hostInfo = "neovim" },
  filetypes = filetypes,
  root_markers = { "package.json", "tsconfig.json" },
  single_file_support = true,
}
