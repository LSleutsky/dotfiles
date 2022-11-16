local present, nvim_session_manager = pcall(require, "session_manager")
local path_present, Path = pcall(require, "plenary.path")

if not present then
  return
end

if not path_present then
  return
end

nvim_session_manager.setup({
  sessions_dir = Path.new(vim.fn.stdpath("data"), "sessions"),
  path_replacer = "__",
  colon_replacer = "++",
  autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
  autosave_last_session = true,
  autosave_ignore_not_normal = true,
  autosave_ignore_filetypes = {
    'gitcommit'
  },
  autosave_only_in_session = true,
  max_path_length = 80
})
