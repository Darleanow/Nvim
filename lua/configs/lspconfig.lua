-- Load NvChad default LSP config
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- List of LSP servers to load
local servers = { "html", "cssls", "clangd", "pyright" }

-- Function to enable format on save
local on_attach = function(client, bufnr)
  nvlsp.on_attach(client, bufnr) -- Load NvChad’s default on_attach

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

-- Configure LSP servers
for _, lsp in ipairs(servers) do
  if lsp == "clangd" or lsp == "pyright" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  else
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end
