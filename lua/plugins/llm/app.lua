-- local prompts = require("plugins.llm.prompts")
local tools = require("llm.tools")
local prompts = require("plugins/llm/prompts")
local models = require("plugins/llm/models")

return {
  app_handler = {
    OptimizeCode = {
      handler = tools.side_by_side_handler,
      prompt = prompts.side_by_side .. "\nthink /no_think",
      opts = {
        -- streaming_handler = local_llm_streaming_handler,
        left = {
          focusable = false,
        },
      },
    },
    OptimCompare = {
      handler = tools.action_handler,
      opts = {},
    },
    WordTranslate = {
      handler = tools.flexi_handler,
      prompt = prompts.WordTranslate,
      opts = {
        exit_on_move = true,
        enter_flexible_window = false,
      },
    },
    Ask = {
      prompt = "You are a helpful chinese assistant.",
      handler = tools.disposable_ask_handler,
      opts = vim.tbl_deep_extend("force", {
        position = { row = 2, col = 0 },
        title = " Ask ",
        inline_assistant = true,
        language = "Chinese",
        -- display diff
        display = { mapping = { mode = "n", keys = { "d" } }, action = nil },
        -- accept diff
        accept = { mapping = { mode = "n", keys = { "Y", "y" } }, action = nil },
        -- reject diff
        reject = { mapping = { mode = "n", keys = { "N", "n" } }, action = nil },
        -- close diff
        close = { mapping = { mode = "n", keys = { "<esc>" } }, action = nil },
      }, models.ollama),
    },
  },
}
