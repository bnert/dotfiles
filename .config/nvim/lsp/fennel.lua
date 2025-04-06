return {
  cmd = { "fennel-ls" },
  filetypes = { "fennel" },
  root_markers = { "flsproject.fnl", ".git"  },
  single_file_support = true,
  settings = {
    ["fennel-ls"] = {
      ["fennel-path"] = "fnl/?/?/?.fnl;fnl/?/?.fnl;fnl/?.fnl;src/?.fnl;./init.fnl",
      ["macro-path"] =  "fnl/macros/?.fnl;fnl/config/macros.fnl",
      ["extra-globals"] = "vim",
      ["lua-version"] = "lua5.4"
    }
  }
}
