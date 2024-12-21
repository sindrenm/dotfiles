require('lazy').setup({
  -- Color schemes
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Core feature enhancements
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  'tpope/vim-speeddating',

  -- Language support
  'tfnico/vim-gradle',
  'tpope/vim-jdaddy',
  'udalov/kotlin-vim',

  -- Searching
  'nelstrom/vim-visual-star-search',

  -- Text formatting
  'tpope/vim-abolish',
  'tpope/vim-surround',

  -- Version control
  'gregsexton/gitv',
  'mhinz/vim-signify',
  'tpope/vim-fugitive',
})
