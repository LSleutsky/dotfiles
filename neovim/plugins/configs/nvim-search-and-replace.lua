local present, nvim_search_and_replace = pcall(require, "nvim-search-and-replace")

if not present then
  return
end

nvim_search_and_replace.setup {
  ignore = {
    "**/test/**",
    "test/**",
    "test",
    "**/coverage/**",
    "coverage/**",
    "coverage",
    "**/bin/**",
    "bin/**",
    "bin",
    "**/node_modules/**",
    "node_modules/**",
    "node_modules",
    "**/.git/**",
    ".git/**",
    ".git",
    "**/.gitignore",
    ".gitignore",
    ".eslintrc.*",
    ".vs",
    ".vs/*",
    ".vscode",
    ".vscode/*",
    "CHANGELOG",
    "LICENSE"
  }
}
