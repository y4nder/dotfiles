vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

require("config.autocmds")
-- require("config.ts-inlay-hints").setup()
require("config.tsserver")
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.paste = false

local cwd = vim.fn.getcwd()
if
  vim.fn.filereadable(cwd .. "/.prettierrc") == 1
  or vim.fn.filereadable(cwd .. "/.prettierrc.json") == 1
  or vim.fn.filereadable(cwd .. "/.prettierrc.js") == 1
  or vim.fn.filereadable(cwd .. "/.eslintrc.json") == 1
  or vim.fn.filereadable(cwd .. "/.eslintrc.js") == 1
then
  require("config.formatting").setup()
end
