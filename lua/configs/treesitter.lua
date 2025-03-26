local options = {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "lua",
    "make",
    "markdown",
    "yaml",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
