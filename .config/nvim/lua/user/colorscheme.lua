

-- local status_ok, scheme = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--  vim.notify("colorscheme " .. colorscheme .. " not found!")
--  return
--end


-- nord colorscheme options
vim.g.nord_italic = true
vim.g.nord_contrast = false
require('nord').set()

