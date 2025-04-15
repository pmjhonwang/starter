local keymaps = require("plugins.llm.keymaps")

return {
  {
    "Kurama622/llm.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    config = function()
      local apps = require("plugins.llm.app")
      local opts = {
        -- [[ local llm ]]
        url = "http://localhost:11434/api/chat",
        model = "deepseek-r1:14b",
        api_type = "ollama",
        max_tokens = 8192,
        temperature = 0.2,
        top_p = 0.7,

        prompt = "You are a helpful chinese assistant.",

        prefix = {
          user = { text = "😃 ", hl = "Title" },
          assistant = { text = "  ", hl = "Added" },
        },

        history_path = "/Users/pmjhonwang/.local/share/nvim/.llm-history",
        save_session = true,
        max_history = 10,
        max_history_name_length = 20,
      }
      for _, conf in pairs({ apps, keymaps }) do
        opts = vim.tbl_deep_extend("force", opts, conf)
      end
      require("llm").setup(opts)
    end,
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "智能助手" },
      -- { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>", desc = "优化代码" },
      { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCompare<cr>", desc = "优化代码" },
      {
        "<leader>ae",
        mode = "v",
        "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>",
        desc = "代码解释",
      },
      { "<leader>aa", mode = "v", "<cmd>LLMAppHandler Ask<cr>", desc = "Ask" },
      -- { "<leader>aw", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>", desc = "帮我写代码" },
    },
  },
}
