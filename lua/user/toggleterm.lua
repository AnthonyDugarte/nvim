local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
  return
end

toggleterm.setup {
  size = 20,
  open_mapping = [[<c-\>]],
  insert_mappings = true,
  terminal_mappings = false,
}
