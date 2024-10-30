vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
vim.g['conjure#client#sql#stdio#command'] = 'psql -h localhost -U blogger -d postgres'
vim.g['conjure#client_on_load'] = false
vim.o.number = true
vim.o.list = true
vim.o.listchars = "tab:⍿·,trail:·"
vim.o.colorcolumn = "80"
vim.o.syntax = 'on'
vim.o.cursorline = true
vim.o.ttyfast = true
vim.o.list = true
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.wo.wrap = true


-- lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "HiPhish/rainbow-delimiters.nvim",
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require('lspconfig')
      -- vim.lsp.set_log_level("debug")
      local _capabilities = vim.lsp.protocol.make_client_capabilities()

      lsp.clojure_lsp.setup({
        capabilities = _capabilities
      })

      lsp.eslint.setup({
        capabilities = _capabilities,
        settings = {
          packageManager = 'npm'
        }
      })

      lsp.pyright.setup({
        capabilities = _capabilities,
      })

      lsp.tailwindcss.setup({
        capabilities = _capabilities,
      })

      lsp.tsserver.setup({
        capabilities = _capabilities,
      })

      lsp.terraformls.setup({
        capabilities = _capabilities,
      })

      lsp.zls.setup({
        capabilities = _capabilities,
      })

      lsp.crystalline.setup({
        capabilities = _capabilities,
      })
    end
  },
  {
    "Olical/conjure",
    config = function()
      vim.keymap.set(
        'n',
        '<leader>rr',
        ":ConjureEval (try (apply (requiring-resolve 'clojure.tools.namespace.repl/refresh) []) (catch Exception e (println \"unable to refresh\")))<CR>"
      )

      vim.keymap.set(
        'n',
        '<leader>rl',
        ":ConjureEval (try (apply (requiring-resolve 'clj-reload.core/reload) []) (catch Exception e (println \"unable to reload\")))<CR>"
      )

      vim.keymap.set(
        'n',
        '<leader>pr',
        ":ConjureEval (try (apply (requiring-resolve 'clj-reload.core/reload) [{:dirs [\"bases\" \"components\" \"projects\"], :no-reload '#{user}, :throw false}]) (catch Exception e (println \"unable to reload\" e)))<CR>"
      )

      vim.keymap.set(
        'n',
        '<leader>rx',
        ":ConjureEval (try ((requiring-resolve 'user/reload!)) (catch Exception e (println \"unable to alias (reload!)\") e))<CR>"
      )

      vim.keymap.set(
        'n',
        '<leader>rX',
        ":ConjureEval (try (apply (requiring-resolve 'user/reload!) [:init]) (catch Exception e (println \"unable to alias (reload!)\") e))<CR>"
      )
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin-latte")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "clojure", "go", "javascript", "html", "typescript" },
          sync_install = false,
          -- highlight = { enable = true },
          indent = { enable = true },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
      vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})
      vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
      vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', {})
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
      vim.keymap.set('n', '<leader>fp',
        function()
          require("telescope").extensions.file_browser.file_browser()
        end
      )
    end
  },
  {
    "julienvincent/nvim-paredit",
    config = function()
      require("nvim-paredit").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function() 
      return {
        ensure_installed = {
          "clj-kondo",
          "clojure-lsp",
          -- "eslint-lsp", manually installed npm install -g vscode-langservers-extracted@4.8.0
          "tailwindcss-language-server",
          "typescript-language-server"
        },
        max_concurrent_installers = 10,
      }
    end,
    config = function(_, opts)
      -- dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom nvchad cmd to install all mason binaries listed
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd "Mason"
          local mr = require("mason-registry")

          mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
              local p = mr.get_package(tool)
              if not p:is_installed() then
                p:install()
              end
            end
          end)
        end
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
    dependencies = { "williamboman/mason.nvim" }
  },
})

require("rainbow-delimiters")

