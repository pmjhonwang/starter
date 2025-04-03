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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- requirements brew install imagemagick
      { "3rd/image.nvim", build = false, opts = {
        processor = "magick_cli",
      } },
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      -- fill any relevant options here
      window = {
        mappings = {
          ["P"] = {
            "toggle_preview",
            config = {
              use_float = true,
              use_image_nvim = true,
              title = "Neo-tree Preview",
            },
          },
        },
      },
    },
  },
}
