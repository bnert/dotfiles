-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local trees = {"clojure", "fennel", "go", "graphql", "javascript", "html", "python", "typescript", "haskell", "zig"}
local function config()
  local configs = require("nvim-treesitter.configs")
  return configs.setup({ensure_installed = trees, highlight = {enable = true}, indent = {enable = true}, sync_install = false})
end
return {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = config}
