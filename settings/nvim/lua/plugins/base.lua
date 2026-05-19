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
  {
    "folke/snacks.nvim",
    opts = {
      dim = {
        -- 启用动画效果（需要 Neovim 0.10 以上）
        animate = { enabled = true },
        scope = {
          -- 生效的最小代码行数
          min_size = 10,
          -- 生效的最大代码行数
          max_size = 20,
          -- 是否包含同级代码块（如 if-else 分支）
          siblings = true,
        },
      },
    },
  },
}
