return {
  {

    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "/Users/pmjhonwang/Workspace/pdd/sms/snippets" })
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { "/Users/pmjhonwang/.config/nvim/lua/snippets/gitcommits.lua" },
      })
    end,
  },
}
