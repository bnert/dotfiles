local clj_reload = {
  "<leader>rl",
  (
    "<cmd>ConjureEval"
    .. "(try (apply (requiring-resolve 'clj-reload.core/reload) []) "
    .. "(catch Exception e (println \"unable to reload\")))"
    .. "<cr>"
  )
}

local repl_refresh = {
  "<leader>rr",
  (
    "<cmd>ConjureEval "
    .. "(try (apply (requiring-resolve 'clojure.tools.namespace.repl/refresh) []) "
    .. "(catch Exception e (println \"Unable to refresh\" e)" .. "<cr>"
  )
}

local function sqlcmd(opts)
  local file = opts["file"]

  local function runner()
    local fd = io.open(file)
    if fd then
      -- _G.vim.print("sqlcmd> loading .sql file")
      local contents = fd:read("*a")
      local contents_ = contents:gsub("\n", "")
      -- _G.vim.print(("sqlcmd> command: " .. contents_))

      _G.vim.g["conjure#client#sql#stdio#command"] = contents_
      return fd:close()
    else
      return nil
    end
  end

  return runner
end

local function reload()
  local action = sqlcmd({file = (_G.vim.loop.cwd() .. "/.sql")})
  return action()
end

local reload_dotsql = {"<leader>rds", reload}

local function noop()
  -- noop
end

_G.vim.g["conjure#mapping#doc_word"] = "K"
_G.vim.g["conjure#client_on_load"] = false

local dotsqlcmd = sqlcmd({file = (_G.vim.loop.cwd() .. "/.sql")})
local function opts()
  dotsqlcmd()
  return nil
end

return {
  "Olical/conjure",
  branch = "main",
  config = noop,
  dependencies = {},
  init = noop,
  keys = {
    clj_reload,
    repl_refresh,
    reload_dotsql
  },
  lazy = false,
  opts = opts
}
