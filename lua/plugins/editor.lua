return {
  -- markview
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },
  -- bufferline
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      -- https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          {
            section = "terminal",
            cmd = "pokemon-colorscripts -rn charmander,pikachu,jigglypuff,starmie,snorlax; sleep .1",
            random = 10,
            pane = 2,
            indent = 4,
            height = 30,
          },
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
