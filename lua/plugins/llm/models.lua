return {
  ["qwen3:4b"] = {
    url = "http://localhost:11434/api/chat",
    model = "qwen3:4b",
    api_type = "ollama",
    max_tokens = 8192,
    temperature = 0.2,
    top_p = 0.7,
  },
  ["deepseek-coder-v2:16b"] = {
    url = "http://localhost:11434/api/chat",
    model = "deepseek-coder-v2:16b",
    api_type = "ollama",
    max_tokens = 8192,
    temperature = 0.2,
    top_p = 0.7,
  },
  chat = {
    qwen3 = {
      url = "http://localhost:11434/api/chat/completions",
      model = "qwen3:4b",
      api_type = "ollama",
    },
  },
  code = {
    qwen3 = {
      url = "http://localhost:11434/api/chat/completions",
      model = "qwen3:4b",
      api_type = "ollama",
    },
  },
  ollama = {
    url = "http://localhost:11434/api/chat",
    model = "qwen3:4b",
    api_type = "ollama",

    fetch_key = function()
      return vim.env.LOCAL_LLM_KEY
    end,

    temperature = 0.3,
    top_p = 0.7,
  },
}
