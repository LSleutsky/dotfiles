local present, gitlinker = pcall(require, "gitlinker")

if not present then
  return
end

gitlinker.setup({
  opts = {
    add_current_line_on_normal_mode = true,
    print_url = true
  },
  mappings = "<leader>gl"
})
