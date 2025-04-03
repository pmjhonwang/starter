return {
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({})
    end,
  },
}
