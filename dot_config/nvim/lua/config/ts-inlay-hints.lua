-- tsserver.lua
local lspconfig = require("lspconfig")

lspconfig.vtsls.setup({
  -- on_attach, capabilities, flags, etc. can go here if you have them
  settings = {
    typescript = {
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },
})
