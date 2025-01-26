if true then
  return {}
end

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
        prefix = {
          user = { text = "😃 ", hl = "Title" },
          assistant = { text = "  ", hl = "Added" },
        },

        prompt = "You are a helpful chinese assistant.",

        -- [[ local llm ]]
        url = "http://localhost:11434/api/chat",
        model = "qwen3:4b",
        api_type = "ollama",
        temperature = 0.3,
        top_p = 0.7,

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
      { "<leader>aa", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "智能助手" },
      {
        "<leader>ae",
        mode = "v",
        "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>",
        desc = "代码解释",
      },
      { "<leader>aq", mode = "v", "<cmd>LLMAppHandler Ask<cr>", desc = "Ask" },
      { "<leader>ac", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>", desc = "[CR]优化代码" },
      { "<leader>at", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>", desc = "翻译" },
    },
  },
}
