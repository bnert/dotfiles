-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function thunk(module, func)
  local function _1_()
    local m = require(module)
    return m[func](m)
  end
  return _1_
end
local keymaps = {{"<leader>ff", thunk("telescope.builtin", "find_files")}, {"<leader>fg", thunk("telescope.builtin", "live_grep")}, {"<leader>fb", thunk("telescope.builtin", "buffers")}, {"<leader>fr", thunk("telescope.builtin", "lsp_references")}, {"<leader>fd", thunk("telescope.builtin", "lsp_definitions")}, {"<leader>fi", thunk("telescope.builtin", "lsp_implementations")}}
return {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}, keys = keymaps}
