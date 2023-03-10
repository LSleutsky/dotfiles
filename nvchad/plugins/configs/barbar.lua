local present, barbar = pcall(require, "bufferline")

if not present then
  return
end

barbar.setup {
  animation = true,
  auto_hide = false,
  clickable = true,
  closable = true,
  icons = 'both',
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  insert_at_end = false,
  insert_at_start = false,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  maximum_padding = 2,
  minimum_padding = 1,
  maximum_length = 30,
  no_name_title = nil,
  semantic_letters = true,
  tabpages = true,
}
