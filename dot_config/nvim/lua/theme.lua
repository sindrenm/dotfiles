-- Enable 24-bit RGB colors if terminal supports it

if vim.fn.has('termguicolors') then
  vim.opt.termguicolors = true
end

-- Remove padding, must run before loading color scheme
-- See https://www.reddit.com/r/neovim/comments/1ehidxy

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then return end
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function() io.write("\027]111\027\\") end,
})

-- Load color scheme

vim.cmd('colorscheme darcula-dark')
