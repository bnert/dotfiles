local root_markers = {
  "pyproject.toml",
  "setup.py",
  "setup.cfg",
  "requirements.txt",
  "Pipfile",
  "pyrightconfig.json",
  ".git"
}

return {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = root_markers,
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly"
      }
    }
  }
}
