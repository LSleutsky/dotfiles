local present, comment_box = pcall(require, "comment-box")

if not present then
  return
end

comment_box.setup({
  doc_width = 100,
  box_width = 100,
  borders = {
    top = "─",
		bottom = "─",
		left = "│",
		right = "│",
		top_left = "╭",
		top_right = "╮",
		bottom_left = "╰",
		bottom_right = "╯"
  },
  line_width = 100,
  line = {
    line = "─",
		line_start = "─",
		line_end = "─"
  },
  outer_blank_lines = false,
  inner_blank_lines = false,
  line_blank_line_above = false,
  line_blank_line_below = false
})
