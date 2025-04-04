vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- vim.g['conjure#client#sql#stdio#command'] = 'psql -h localhost -U blogger -d postgres'
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

vim.diagnostic.config({
  virtual_lines = { current_line = true }
})

local function thunkquire(module, path)
  return function()
    local m = require(module)
    if type(path) == "string" then
      path = { path }
    end

    for _, p in pairs(path) do
      m = m[p]
    end

    return m()
  end
end

-- lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line:undefined-field
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
  {
    "Olical/conjure",
    opts = {},
    lazy = false,
    config = function()
      -- noop
    end,
    init = function()
      -- noop
    end,
    keys = {
      {
        "<leader>rr",
        "<cmd>ConjureEval (try (apply (requiring-resolve 'clojure.tools.namespace.repl/refresh) []) (catch Exception e (println \"unable to refresh\")))<cr>",
        desc = "Refresh repl using tools.namespace",
      },
      {
        "<leader>rl",
        "<cmd>ConjureEval (try (apply (requiring-resolve 'clj-reload.core/reload) []) (catch Exception e (println \"unable to reload\")))<cr>",
        desc = "Refresh repl using clj-reload"
      }
    },

  },
  { "Olical/nfnl", ft = "fennel" },
  {
    "rose-pine/neovim",
    name = "rose-pine-dawn",
    config = function()
      vim.cmd("colorscheme rose-pine-dawn")
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      ---@diagnostic disable-next-line:missing-fields
      configs.setup({
          ensure_installed = {
            "clojure"
            , "fennel"
            , "go"
            , "graphql"
            , "javascript"
            , "html"
            , "python"
            , "typescript"
            , "haskell"
            , "zig"
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>ff",
        thunkquire("telescope.builtin", "find_files")
      },
      {
        "<leader>fg",
        thunkquire("telescope.builtin", "live_grep")
      },
      {
        "<leader>fb",
        thunkquire("telescope.builtin", "buffers")
      },
      {
        "<leader>fr",
        thunkquire("telescope.builtin", "lsp_references")
      },
      {
        "<leader>fd",
        thunkquire("telescope.builtin", "lsp_definitions")
      },
      {
        "<leader>fi",
        thunkquire("telescope.builtin", "lsp_implementations")
      },
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
      {
        '<leader>fp',
        thunkquire("telescope", { "extensions", "file_browser", "file_browser" })
      }
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },
  {
    -- only loads for lisps :)
    "julienvincent/nvim-paredit",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonInstallAll",
      "MasonUpdate"
    },
    enabled = true,
    keys = {
      {
        "<leader>mi<cr>",
        "<cmd>MasonInstallAll<cr>",
        desc = "Mason install"
      },
      {
        "<leader>mu<cr>",
        "<cmd>MasonUpdate<cr>",
        desc = "Mason update"
      }
    },
    opts = {
      ensure_installed = {
        "clj-kondo",
        "clojure-lsp",
        "eslint-lsp",
        "fennel-ls",
        "haskell-language-server",
        "lua-language-server",
        "prettier",
        "pyright",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
        "typos-lsp",
        "zls"
      },
      max_concurrent_installers = 10,
    },
    config = function(_, opts)
      -- dofile(vim.g.base46_cache .. "mason")
      require("mason").setup(opts)

      -- custom cmd to install all mason binaries listed
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
  -- needed for injecting mason config into vim env
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "sindrets/diffview.nvim",
    opts = {
      use_icons = false
    },
    keys = {
      {
        "<leader>dvm",
        "<cmd>DiffviewOpen origin/main...HEAD<cr>",
        desc = "Open diff against main"
      },
    }
  },
})

vim.lsp.config('*', {
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  root_markers = { '.git' },
})

vim.lsp.enable({
  "clojure"
  -- has issues, see: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/eslint.lua
  --, "eslint"
  , "fennel"
  , "lua"
  , "python"
  , "tailwindcss"
  , "typescript"
  , "typos"
  , "zls"
})

