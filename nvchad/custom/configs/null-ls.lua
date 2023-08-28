local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  b.code_actions.eslint_d,
  b.code_actions.gitrebase,
  b.code_actions.gitsigns,
  b.diagnostics.commitlint,
  b.diagnostics.eslint_d,
  b.diagnostics.markdownlint,
  b.formatting.clang_format,
  b.formatting.eslint_d,
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  b.formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
