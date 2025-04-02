-- local prompts = require("plugins.llm.prompts")
local tools = require("llm.tools")

return {
  app_handler = {
    Completion = {
      handler = tools.completion_handler,
      opts = {
        -------------------------------------------------
        ---                   ollama
        -------------------------------------------------
        url = "http://localhost:11434/v1/completions",
        model = "qwen2.5-coder:1.5b",
        api_type = "ollama",
        ------------------- end ollama ------------------

        -------------------------------------------------
        ---                  deepseek
        -------------------------------------------------
        -- url = "https://api.deepseek.com/beta/completions",
        -- model = "deepseek-chat",
        -- api_type = "deepseek",
        -- fetch_key = function()
        --   return "your api key"
        -- end,
        ------------------ end deepseek -----------------

        -------------------------------------------------
        ---                  codeium
        ---    dependency: "Exafunction/codeium.nvim"
        -------------------------------------------------
        -- api_type = "codeium",
        ------------------ end codeium ------------------

        n_completions = 3,
        context_window = 512,
        max_tokens = 256,

        -- A mapping of filetype to true or false, to enable completion.
        filetypes = { sh = false },

        -- Whether to enable completion of not for filetypes not specifically listed above.
        default_filetype_enabled = true,

        auto_trigger = true,

        -- just trigger by { "@", ".", "(", "[", ":", " " } for `style = "nvim-cmp"`
        only_trigger_by_keywords = true,

        style = "virtual_text", -- nvim-cmp or blink.cmp

        timeout = 10, -- max request time

        -- only send the request every x milliseconds, use 0 to disable throttle.
        throttle = 1000,
        -- debounce the request in x milliseconds, set to 0 to disable debounce
        debounce = 400,

        --------------------------------
        ---   just for virtual_text
        --------------------------------
        keymap = {
          virtual_text = {
            accept = {
              mode = "i",
              keys = "<A-a>",
            },
            next = {
              mode = "i",
              keys = "<A-n>",
            },
            prev = {
              mode = "i",
              keys = "<A-p>",
            },
            toggle = {
              mode = "n",
              keys = "<leader>cp",
              desc = "Toggle auto completion",
            },
          },
        },
      },
    },
    OptimizeCode = {
      handler = tools.side_by_side_handler,
      opts = {
        -- [[ local llm  for code OptimizeCode ]]
        url = "http://localhost:11434/api/chat",
        model = "deepseek-coder-v2:16b",
        api_type = "ollama",
        max_tokens = 8192,
        temperature = 0.2,
        top_p = 0.7,
        left = {
          focusable = false,
        },
      },
    },
    OptimizeCompare = {
      handler = tools.action_handler,
      opts = {
        url = "http://localhost:11434/api/chat",
        model = "deepseek-coder-v2:16b",
        api_type = "ollama",
        max_tokens = 8192,
        temperature = 0.2,
        top_p = 0.7,
      },
    },
    Ask = {
      handler = tools.disposable_ask_handler,
      opts = {
        url = "http://localhost:11434/api/chat",
        model = "deepseek-r1:14b",
        api_type = "ollama",
        max_tokens = 8192,
        temperature = 0.2,
        top_p = 0.7,
        prompt = "You are a helpful chinese assistant.",

        position = {
          row = 2,
          col = 0,
        },
        title = " Ask ",
        inline_assistant = true,
        language = "Chinese",
        -- display diff
        display = {
          mapping = { mode = "n", keys = { "d" } },
          action = nil,
        },
        -- accept diff
        accept = {
          mapping = { mode = "n", keys = { "Y", "y" } },
          action = nil,
        },
        -- reject diff
        reject = {
          mapping = { mode = "n", keys = { "N", "n" } },
          action = nil,
        },
        -- close diff
        close = {
          mapping = { mode = "n", keys = { "<esc>" } },
          action = nil,
        },
      },
    },
  },
}
