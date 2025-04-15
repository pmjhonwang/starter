return { -- lazy.nvim
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    opts = {
      snippetDir = vim.env.CUSTOME_SNIPPETS_PATH_VSCODE,
    },
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.env.CUSTOME_SNIPPETS_PATH_VSCODE })
      require("luasnip.loaders.from_snipmate").lazy_load({
        paths = { "~/.config/nvim/snippets/vim-snippets/snippets" },
        include = { "javascript", "typescript", "typescriptreact" },
      })
    end,
  },
}
