return {
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local lualine = require("lualine")
      lualine.setup({
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  },
}
