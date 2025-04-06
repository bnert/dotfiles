-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function thunk(module, func)
  local function _1_()
    local m = require(module)
    return m[func](m)
  end
  return _1_
end
local keymaps = {{"<leader>tf", thunk("telescope.builtin", "find_files")}, {"<leader>tg", thunk("telescope.builtin", "live_grep")}, {"<leader>tb", thunk("telescope.builtin", "buffers")}, {"<leader>td", thunk("telescope.builtin", "diagnostics")}, {"<leader>lr", thunk("telescope.builtin", "lsp_references")}, {"<leader>ld", thunk("telescope.builtin", "lsp_definitions")}, {"<leader>lI", thunk("telescope.builtin", "lsp_implementations")}, {"<leader>lt", thunk("telescope.builtin", "lsp_type_definitions")}, {"<leader>li", thunk("telescope.builtin", "lsp_incoming_calls")}, {"<leader>lo", thunk("telescope.builtin", "lsp_outgoing_calls")}}
return {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}, keys = keymaps}
