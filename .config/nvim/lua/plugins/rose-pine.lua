-- [nfnl] fnl/plugins/rose-pine.fnl
local function _1_()
  vim.cmd("colorscheme rose-pine-dawn")
  return nil
end
return {"rose-pine/neovim", config = _1_, name = "rose-pine-dawn"}
