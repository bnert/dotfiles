-- [nfnl] Compiled from fnl/plugins/telescope-file-browser.fnl by https://github.com/Olical/nfnl, do not edit.
local function load_extension()
  local telescope = require("telescope")
  return telescope.load_extension("file_browser")
end
local function browse_file()
  local telescope = require("telescope")
  local action = telescope.extensions.file_browser.file_browser
  return action()
end
local keymaps = {{"<leader>fp", browse_file}}
return {"nvim-telescope/telescope-file-browser.nvim", config = load_extension, keys = keymaps}
