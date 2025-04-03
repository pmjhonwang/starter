return {
  -- markview
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  -- cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- Configure LazyVim to load cyberdream
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
      dashboard = {
        preset = {
          header = [[
          ██████╗ ███╗   ███╗     ██╗██╗  ██╗ ██████╗ ███╗   ██╗██╗    ██╗ █████╗ ███╗   ██╗ ██████╗
          ██╔══██╗████╗ ████║     ██║██║  ██║██╔═══██╗████╗  ██║██║    ██║██╔══██╗████╗  ██║██╔════╝
          ██████╔╝██╔████╔██║     ██║███████║██║   ██║██╔██╗ ██║██║ █╗ ██║███████║██╔██╗ ██║██║  ███╗
          ██╔═══╝ ██║╚██╔╝██║██   ██║██╔══██║██║   ██║██║╚██╗██║██║███╗██║██╔══██║██║╚██╗██║██║   ██║
          ██║     ██║ ╚═╝ ██║╚█████╔╝██║  ██║╚██████╔╝██║ ╚████║╚███╔███╔╝██║  ██║██║ ╚████║╚██████╔╝
          ╚═╝     ╚═╝     ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝

          ]],
        },
        sections = {
          { section = "header" },
          { section = "keys" },
          { section = "startup" },
        },
      },
    },
  },
}
