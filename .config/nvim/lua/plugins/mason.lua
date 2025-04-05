-- [nfnl] Compiled from fnl/plugins/mason.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {ensure_installed = {"clj-kondo", "clojure-lsp", "eslint-lsp", "fennel-ls", "haskell-language-server", "lua-language-server", "prettier", "pyright", "tailwindcss-language-server", "terraform-ls", "typescript-language-server", "typos-lsp", "zls"}, max_concurrent_installers = 10}
local function config(_, opts0)
  do
    local mason = require("mason")
    mason.setup(opts0)
    local function _1_()
      if (opts0.ensure_installed and (0 < #opts0.ensure_installed)) then
        vim.cmd("Mason")
        local mr = require("mason-registry")
        local function _2_()
          for _0, tool in ipairs(opts0.ensure_installed) do
            local pkg = mr.get_package(tool)
            if not pkg:is_installed() then
              pkg:install()
            else
            end
          end
          return nil
        end
        mr.refresh(_2_)
      else
      end
      vim.g.mason_binaries_list = opts0.ensure_installed
      return nil
    end
    vim.api.nvim_create_user_command("MasonInstallAll", _1_, {})
  end
  return nil
end
return {"williamboman/mason.nvim", cmd = {"Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate"}, config = config, enabled = true, opts = opts}
