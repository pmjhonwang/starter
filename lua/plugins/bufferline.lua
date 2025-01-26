return {
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({})
    end,
  },
}
