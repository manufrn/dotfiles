local colorscheme = "nord" -- set colorscheme here


-- local status_ok, scheme = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--  vim.notify("colorscheme " .. colorscheme .. " not found!")
--  return
--end

require('nordic').colorscheme({
    underline_option = 'none',
    italic = false,
    italic_comments = false,
    minimal_mode = false,
    alternate_backgrounds = true
})

-- nord colorscheme options
vim.g.nord_italic = false
vim.g.nord_contrast = false
require('nord').set()

