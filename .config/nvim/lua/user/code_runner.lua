local cmp_status_ok, code_runner = pcall(require, "code_runner")
if not cmp_status_ok then
  return
end

code_runner.setup({
  filetype = {
    python = "python3 -u",
    tex = "latexmk -pdf -pvc"
  },
  -- choose default mode (valid term, tab, float, toggle)
  mode = 'toggleterm',
  -- Focus on runner window(only works on toggle, term and tab mode)
  focus = false,
  -- startinsert (see ':h inserting-ex')
  startinsert = true,
})
