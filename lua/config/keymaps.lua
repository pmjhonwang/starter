-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>tgh", function()
  require("telescope.builtin").live_grep({ additional_args = { "-u" } })
end, { desc = "Telescope Grep Hidden" })
