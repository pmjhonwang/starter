return {
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "css",
        "scss",
        "tsx",
        "typescript",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        css_variables = {},
        cssmodules_ls = {},
      },
    },
  },
  -- markview
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  -- flash
  {
    "folke/flash.nvim",
    opt = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        false,
      },
      {
        "S",
        mode = { "n", "x", "o" },
        false,
      },
    },
  },
  -- blink
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opt = {
      completion = {
        trigger = { prefetch_on_insert = false },
        list = {
          selection = { preselect = false, auto_insert = false },
        },
        ghost_text = { enabled = true },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      snippets = { preset = "luasnip" },
    },
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
      -- ---@class snacks.terminal: snacks.win
      -- ---@field cmd? string | string[]
      -- ---@field opts snacks.terminal.Opts
      -- terminal = {
      --   win = {
      --     style = "float",
      --     width = math.floor(vim.o.columns * 0.5),
      --     height = math.floor(vim.o.lines * 0.5),
      --   },
      -- },
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
          indent = 2,
          padding = 1,
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
