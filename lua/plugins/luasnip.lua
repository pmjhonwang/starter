return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local loaderFromVsCode = require("luasnip.loaders.from_vscode")
      loaderFromVsCode.lazy_load()
      loaderFromVsCode.lazy_load({ paths = "/Users/pmjhonwang/Workspace/pdd/sms/snippets" })
    end,
  },
}
