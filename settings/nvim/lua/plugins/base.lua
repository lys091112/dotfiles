return {
  -- { "akinsho/bufferline.nvim", enabled = false },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap["<Tab>"] = {
        -- require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            -- 支持tab键选择下一个
            return cmp.select_next()
            -- return cmp.select_and_accept()
          end
        end,
        LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
        "fallback",
      }
    end,
  },
}
