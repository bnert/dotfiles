-- [nfnl] fnl/plugins/treesitter.fnl
local trees = {"clojure", "fennel", "go", "graphql", "javascript", "html", "python", "typescript", "haskell", "sql", "zig"}
local function config()
  local configs = require("nvim-treesitter.configs")
  return configs.setup({ensure_installed = trees, highlight = {enable = true}, indent = {enable = true}, sync_install = false})
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = config}
