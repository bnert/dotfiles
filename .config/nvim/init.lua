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
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = require('lspconfig')
      -- vim.lsp.set_log_level("debug")
      local _capabilities = vim.lsp.protocol.make_client_capabilities()

      lsp.clojure_lsp.setup({
        capabilities = _capabilities
      })

      lsp.crystalline.setup({
        capabilities = _capabilities,
      })

      lsp.eslint.setup({
        capabilities = _capabilities,
        settings = {
          packageManager = 'npm'
        }
      })

      lsp.lua_ls.setup({
        capabilities = _capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        }
      })

      lsp.pyright.setup({
        capabilities = _capabilities,
      })

      lsp.tailwindcss.setup({
        capabilities = _capabilities,
      })

      lsp.terraformls.setup({
        capabilities = _capabilities,
      })

      lsp.ts_ls.setup({
        capabilities = _capabilities,
      })

      lsp.zls.setup({
        capabilities = _capabilities,
      })

    end
  },
  {
    "poljar/typos.nvim",
    opts = {},
    enabled = vim.fn.executable('typos') == 1
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      --"mason.nvim",
      "typos.nvim"
    },
  },
  {
    "Olical/conjure",
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
            "clojure",
            "go",
            "javascript",
            "html",
            "typescript",
            "haskell",
            "zig"
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
      })
    end
  },
  {
    "folke/trouble.nvim",
    version = "v3.6.0",
    cmd = "Trouble",
    opts = {},
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      {
        "<leader>tt",
        "<cmd>Neotree<cr>",
        desc = "Open neotree"
      }
    }
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
        "haskell-language-server",
        "lua-language-server",
        "prettier",
        "pyright",
        "tailwindcss-language-server",
        "terraform-ls",
        "typescript-language-server",
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
  {
    "nvimtools/none-ls.nvim",
    opts = {
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })

          -- format on save
          local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
          local event = "BufWritePre"
          local async = event == "BufWritePost"

          vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
          vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, async = async })
            end,
            desc = "[lsp] format on save",
          })
        end

        if client.supports_method("textDocument/rangeFormatting") then
          vim.keymap.set("x", "<leader>lf", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = bufnr, desc = "[lsp] format" })
        end
      end
    }
  }
})

