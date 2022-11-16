local present, todo_comments = pcall(require, "todo-comments")

if not present then
  return
end

todo_comments.setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      alt = {"BUG", "FIXIT", "FIXME", "ISSUE"},
      color = "error"
    },
    PERF = {
      alt = {"OPTIM", "OPTIMIZE", "PERFORMANCE"}
    },
    TODO = {
      color = "info"
    }
  },
  highlight = {
    before = "",
    keyword = "wide",
    after = "",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400
  },
  colors = {
    error = {"DiagnosticError", "ErrorMsg", "#DC2626"},
    info = {"DiagnosticInfo", "#2563EB"}
  }
}
