-- lua/project/null-ls-setup.lua
local M = {}

function M.setup()
  local ok, null_ls = pcall(require, "null-ls")
  if not ok then
    vim.notify("null-ls not installed", vim.log.levels.ERROR)
    return
  end

  -- Use project-local prettier/eslint
  local prettier = null_ls.builtins.formatting.prettier.with({
    extra_args = { "--config-precedence", "prefer-file" },
  })
  local eslint = {
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.diagnostics.eslint,
  }

  null_ls.setup({
    sources = { prettier, unpack(eslint) },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  })

  -- Optional: auto-detect filetypes for formatting
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript", "typescript", "typescriptreact", "json", "css", "scss", "html" },
    callback = function()
      vim.bo.formatprg = "prettier --stdin-filepath %"
    end,
  })

  -- Optional: organize imports
  vim.api.nvim_create_user_command("OrganizeImports", function()
    vim.lsp.buf.execute_command({
      command = "_typescript.organizeImports",
      arguments = { vim.api.nvim_buf_get_name(0) },
    })
  end, {})
end

return M
