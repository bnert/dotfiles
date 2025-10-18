local root_markers = {
  ".luarc.json",
  ".luarc.jsonc",
  ".luacheckrc",
  ".stylua.toml",
  "stylua.toml",
  "selene.toml",
  "selene.yml",
  ".git"
}

local library = _G.vim.api.nvim_get_runtime_file("", true)

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = root_markers,
  single_file_support = true,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        globals = { "vim", "require" }
      },
      workspace = {
        library = library
      }
    }
  }
}
