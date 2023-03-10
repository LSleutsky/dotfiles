local present, diffview = pcall(require, "diffview")

if not present then
  return
end

diffview.setup({
  enhanced_diff_hl = false,
  git_cmd = { "git" },
  use_icons = true,
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
  file_panel = {
    listing_style = "tree"
  }
})
