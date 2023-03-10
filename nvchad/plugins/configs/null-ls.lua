local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.code_actions.eslint_d,
  b.code_actions.gitrebase,
  b.code_actions.gitsigns,
  b.diagnostics.commitlint,
  b.diagnostics.eslint_d,
  b.diagnostics.markdownlint,
  b.formatting.eslint_d,
  b.formatting.prettierd.with({
    env = {
      PRETTIERD_LOCAL_PRETTIER_ONLY = 1
    }
  }),
  b.formatting.stylua
}

null_ls.setup {
  debug = true,
  sources = sources
}
