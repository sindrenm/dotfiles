vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.enable({
  "jsonls",
  "lua_ls",
  "nil_ls",
  "rust_analyzer",
  "taplo",
  "yamlls",
})
