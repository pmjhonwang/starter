return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    opts = {
      snippetDir = vim.env.CUSTOME_SNIPPETS_PATH_VSCODE,
      ---@type "yq"|"jq"|"none"|string[]
      jsonFormatter = "jq",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local luasnip = require("luasnip")
      luasnip.setup({
        cut_selection_keys = { "TM_SELECTED_TEXT" },
        store_selection_keys = "<Tab>",
      })
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.env.CUSTOME_SNIPPETS_PATH_VSCODE })
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = { "~/.config/nvim/snippets/vim-snippets/snippets" },
        include = { "javascript", "typescript", "typescriptreact", "css", "scss", "sass", "html" },
      })
    end,
  },
}
