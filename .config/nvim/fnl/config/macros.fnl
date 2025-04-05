;; [nfnl-macro]

; Thanks Olical: https://github.com/Olical/dotfiles/blob/141e82ef966ff42e6eda854263c2a7f9a34b56c9/stowed/.config/nvim/fnl/config/macros.fnl
(fn tx [& args]
  "Mixed sequential and associative tables at compile time. Because the Neovim ecosystem loves them but Fennel has no neat way to express them (which I think is fine, I don't like the idea of them in general)."
  (let [to-merge (when (table? (. args (length args)))
                   (table.remove args))]
    (if to-merge
      (do
        (each [key value (pairs to-merge)]
          (tset args key value))
        args)
      args)))

{: tx}
