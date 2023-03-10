local present, pqf = pcall(require, "pqf")

if not present then
  return
end

pqf.setup({
  signs = {
    error = "E",
    warning = "W",
    info = "I",
    hint = "H"
  },
  show_multiple_lines = false
})
