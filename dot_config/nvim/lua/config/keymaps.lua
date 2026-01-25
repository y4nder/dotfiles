-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

vim.keymap.set("n", "<leader>th", function()
  require("inlay-hints").toggle()
end, { desc = "Toggle Inlay Hints" })

vim.keymap.set({ "n", "t" }, "<C-/>", function()
  local Terminal = require("toggleterm.terminal").Terminal
  if not _G.__float_term then
    _G.__float_term = Terminal:new({
      direction = "float",
      hidden = true,
    })
  end
  _G.__float_term:toggle()
end, { desc = "Toggle floating terminal" })
