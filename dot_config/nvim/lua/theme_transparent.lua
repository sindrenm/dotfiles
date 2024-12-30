-- Enable 24-bit RGB colors if terminal supports it

if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end

-- Load color scheme

vim.cmd('colorscheme darcula-dark')

-- Make background transparent – run after loading color scheme

vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
