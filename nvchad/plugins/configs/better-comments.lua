local present, better_comments = pcall(require, "better_comment")

if not present then
  return
end

better_comments.Setup({
  tags = {
    {
      name = "TODO",
      fg = "white",
      bg = "#0a7aca",
      bold = true,
      virtual_text = ""
    },
    {
    {
      name = "FIX",
      fg = "white",
      bg = "#f44747",
      bold = true,
      virtual_text = ""
    },
      name = "FIXME",
      fg = "white",
      bg = "#f44747",
      bold = true,
      virtual_text = ""
    },
    {
      name = "WARNING",
      fg = "#ffa500",
      bg = "",
      bold = true,
      virtual_text = ""
    },
    {
      name = "!",
      fg = "#f44747",
      bg = "",
      bold = true,
      virtual_text = ""
    },
    {
      name = "!!",
      fg = "#f44747",
      bg = "",
      bold = true,
      virtual_text = ""
    }
  }
})
