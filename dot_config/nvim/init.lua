require("gen-spell-files")
require("lazy-init")
require("lazy-plugins")
require("theme_transparent")

-- Enable syntax highlighting
vim.cmd [[ syntax enable ]]

-- Ignore case when searching, unless at least one
-- uppercase character is used in the search term
vim.optignorecase = true
vim.opt.smartcase = true

-- Enable line numbers
vim.opt.number = true

-- Allow cursor to move to all empty spaces
vim.opt.virtualedit = all

-- Prefer 2 spaces over tabs by default
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Make sure Vim knows we have a dark background
vim.opt.background = dark
