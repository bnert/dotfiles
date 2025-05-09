-- [nfnl] fnl/plugins/conjure.fnl
local clj_reload = {"<leader>rl", ("<cmd>ConjureEval" .. "(try (apply (requiring-resolve 'clj-reload.core/reload) []) (catch Exception e (println \"unable to reload\")))" .. "<cr>")}
local repl_refresh = {"<leader>rr", ("<cmd>ConjureEval " .. "(try (apply (requiring-resolve 'clojure.tools.namespace.repl/refresh) []) " .. "(catch Exception e (println \"Unable to refresh\" e)" .. "<cr>")}
local function noop()
end
vim.g["conjure#mapping#doc_word"] = "K"
return {"Olical/conjure", config = noop, dependencies = {"Olical/nfnl"}, init = noop, keys = {clj_reload, repl_refresh}, lazy = false, opts = {}}
