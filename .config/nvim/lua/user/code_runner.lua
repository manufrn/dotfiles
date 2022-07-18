local cmp_status_ok, code_runner = pcall(require, "code_runner")
if not cmp_status_ok then
  return
end

code_runner.setup({
  filetype = {
    python = "python3 -u",
  },
})
