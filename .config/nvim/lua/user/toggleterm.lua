local cmp_status_ok, toggleterm = pcall(require, "toggleterm")
if not cmp_status_ok then
  return
end

toggleterm.setup{
  open_mapping = [[<c-\>]]
}
