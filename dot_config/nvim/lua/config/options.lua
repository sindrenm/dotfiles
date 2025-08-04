-- Use 2 spaces for indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Show rounded borders around floating windows
vim.opt.winborder = "rounded"

-- Show relative line numbers, but with the actual line number on the current line
vim.opt.number = true
vim.opt.relativenumber = true

-- Always show the sign column to avoid jumping
vim.opt.signcolumn = "yes"

-- Make searches case-insensitive, unless at least one capitalized letter is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable GUI colors in the terminal
vim.opt.termguicolors = true

-- Preview all substitutions in a split
vim.opt.inccommand = "split"

-- Allow cursor on non-character lines
vim.opt.virtualedit = "all"
