local on_attach = function(client, bufnr)
  local nvlsp_ok, nvlsp = pcall(require, "nvchad.configs.lspconfig")
  if nvlsp_ok and nvlsp.on_attach then
    nvlsp.on_attach(client, bufnr)
  end

  -- Format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

local common_config = {
  on_attach = on_attach,
}

vim.lsp.config("html", common_config)
vim.lsp.config("cssls", common_config)
vim.lsp.config("clangd", common_config)
vim.lsp.config("pyright", common_config)

vim.lsp.enable { "html", "cssls", "clangd", "pyright" }
