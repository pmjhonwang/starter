return {
  -- icons
  { "nvim-tree/nvim-web-devicons" },
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
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          separator_style = "thick",
          style_preset = bufferline.style_preset.minimal, -- or bufferline.style_preset.minimal,
          custom_areas = {
            right = function()
              local result = {}
              local seve = vim.diagnostic.severity
              local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
              local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
              local info = #vim.diagnostic.get(0, { severity = seve.INFO })
              local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

              if error ~= 0 then
                table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
              end

              if warning ~= 0 then
                table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
              end

              if hint ~= 0 then
                table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
              end

              if info ~= 0 then
                table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
              end
              return result
            end,
          },
        },
      })
    end,
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
