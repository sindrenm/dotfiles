local fidget = require("fidget")
local lazydev = require("lazydev")

fidget.setup({})

lazydev.setup({
  integrations = {
    lspconfig = false,
  },
  library = {
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

vim.lsp.config("lua_ls", {
  on_init = function(client)
    -- Pre-populate settings so lua_ls's first workspace/configuration
    -- request gets a valid response before lazydev's 100ms debounce fires.
    -- Lazydev will layer plugin libraries on top via its own update cycle.
    client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = vim.tbl_filter(function(p)
            return not vim.startswith(p, vim.fn.stdpath("config"))
          end, vim.api.nvim_get_runtime_file("lua", true)),
        },
      },
    })
  end,
})

vim.lsp.enable({
  "csharp_ls",
  "cssls",
  "hls",
  "html",
  "hyprls",
  "jsonls",
  "kotlin_lsp",
  "lua_ls",
  "nixd",
  "nushell",
  "rust_analyzer",
  "ts_ls",
})
