vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,

  view_options = {
    natural_order = true,
  },

  win_options = {
    wrap = true,
  }
})
