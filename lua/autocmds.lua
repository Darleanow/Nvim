require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
  callback = function()
    vim.cmd("silent! %!clang-format")
  end,
})

