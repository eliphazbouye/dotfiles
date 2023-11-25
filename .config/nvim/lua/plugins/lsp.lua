return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  { 
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.tsserver.setup {
        capabilities = capabilities,
      }
      lspconfig.pyright.setup {
        capabilities = capabilities,
      }
      lspconfig.intelephense.setup {
        capabilities = capabilities,
      }
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
    end
  },
}
