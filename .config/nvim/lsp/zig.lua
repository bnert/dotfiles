return {
  cmd = { vim.env.MASON .. "/bin/zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "zls.json", "build.zig", ".git" },
  singe_file_support = true,
  settings = {
    on_new_config = function(new_config, new_root_dir)
      if vim.fn.filereadable(vim.fs.joinpath(new_root_dir, "zls.json")) ~= 0 then
        new_config.cmd = { "zls", "--config-path", "zls.json" }
      end
    end,
  }
}
