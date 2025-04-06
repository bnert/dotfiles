(comment
  (local config (require :nfnl.config))
  (let [{:fennel-path fennel-path
         :fennel-macro-path macro-path}
        (config.default
          {:root-dir "."
           :rtp-patterns ["."]})]
    {:extra-globals "vim"
     :lua-version "lua5.1"
     : fennel-path
     : macro-path}))

{:fennel-path   "fnl/?/?/?.fnl;fnl/?/?.fnl;fnl/?.fnl;./init.fnl"
 :macro-path    "fnl/config/macros.fnl"
 :extra-globals "vim"
 :lua-version   "lua5.4"}
