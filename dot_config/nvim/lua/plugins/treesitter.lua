return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false, -- load immediately
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "typescript", "tsx", "javascript", "json", "lua" },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
