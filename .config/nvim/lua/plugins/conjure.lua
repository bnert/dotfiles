-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local clj_reload = {"<leader>rl", ("<cmd>ConjureEval" .. "(try (apply (requiring-resolve 'clj-reload.core/reload) []) (catch Exception e (println \"unable to reload\")))" .. "<cr>")}
local repl_refresh = {"<leader>rr", ("<cmd>ConjureEval " .. "(try (apply (requiring-resolve 'clojure.tools.namespace.repl/refresh) []) " .. "(catch Exception e (println \"Unable to refresh\" e)" .. "<cr>")}
local function noop()
end
vim.g["conjure#filetype#fennel"] = "conjure.client.fennel.nfnl"
vim.g["conjure#mapping#doc_word"] = "K"
return {"Olical/conjure", config = noop, init = noop, keys = {clj_reload, repl_refresh}, lazy = false, opts = {}}
