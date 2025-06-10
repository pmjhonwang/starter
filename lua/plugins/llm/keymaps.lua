return {
  keys = {
    -- The keyboard mapping for the input window.
    ["Input:Submit"] = { mode = "n", key = "<cr>" },
    ["Input:Cancel"] = { mode = { "n", "i" }, key = "<C-c>" },
    ["Input:Resend"] = { mode = { "n", "i" }, key = "<C-r>" },

    -- only works when "save_session = true"
    ["Input:HistoryNext"] = { mode = { "n", "i" }, key = "<C-j>" },
    ["Input:HistoryPrev"] = { mode = { "n", "i" }, key = "<C-k>" },

    -- The keyboard mapping for the output window in "split" style.
    ["Output:Ask"] = { mode = "n", key = "i" },
    ["Output:Cancel"] = { mode = "n", key = "<C-c>" },
    ["Output:Resend"] = { mode = "n", key = "<C-r>" },

    -- The keyboard mapping for the output and input windows in "float" style.
    ["Session:Toggle"] = { mode = "n", key = "<leader>ac" },
    ["Session:Close"] = { mode = "n", key = { "<esc>", "Q" } },
    -- ["Session:History"]     = { mode = "n", key = {"<C-h>"} },

    -- Focus
    ["Focus:Input"] = { mode = "n", key = { "i", "<C-w>" } },
    ["Focus:Output"] = { mode = { "n", "i" }, key = "<C-w>" },
  },
}
