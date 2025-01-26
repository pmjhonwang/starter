-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>tgh", function()
  require("telescope.builtin").live_grep({ additional_args = { "-u" } })
end, { desc = "Telescope Grep Hidden" })

-- map("n", "<leader>gr", "<cmd>:Telescope lsp_references<cr>", { desc = "Telescope LSP reference" })

vim.keymap.set("n", "<leader>se", function()
  require("scissors").editSnippet()
end, { desc = "Snippet: Edit" })

-- when used in visual mode, prefills the selection as snippet body
vim.keymap.set({ "n", "x" }, "<leader>sa", function()
  require("scissors").addNewSnippet()
end, { desc = "Snippet: Add" })
