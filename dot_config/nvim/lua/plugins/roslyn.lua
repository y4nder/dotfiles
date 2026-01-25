return {

  -- Mason with custom registries
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- required for Roslyn
      },
    },
  },

  -- Mason-LSPConfig — leave roslyn out
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {}, -- do NOT include roslyn here
    },
  },

  -- Roslyn Nvim plugin
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor", "cshtml" },
    opts = {}, -- default is fine
  },
}
