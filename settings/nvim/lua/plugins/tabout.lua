-- ~/.config/nvim/lua/plugins/tabout.lua
return {
  {
    "abecodes/tabout.nvim",
    lazy = false, -- 确保立即加载
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- 依赖 treesitter 做精准识别
      "hrsh7th/nvim-cmp", -- 与补全插件集成
    },
    opts = {
      -- 基础按键配置
      tabkey = "<Tab>", -- 向前跳出
      backwards_tabkey = "<S-Tab>", -- 向后跳出

      -- 行为配置
      act_as_tab = true, -- 无法跳出时作为普通 Tab
      act_as_shift_tab = false, -- 反向无法跳出时不作为普通 Shift-Tab

      -- 默认 Tab 行为（当作为普通 Tab 使用时）
      default_tab = "<C-t>", -- 普通 Tab 行为
      default_shift_tab = "<C-d>", -- 普通 Shift-Tab 行为

      -- 补全集成
      completion = true, -- 与 nvim-cmp 集成

      -- 边界处理
      ignore_beginning = true, -- 行首不触发跳出

      -- 排除的文件类型（根据需要添加）
      exclude = { "help", "markdown" },

      -- 高级配置：自定义跳出符号对
      pairs = {
        { left = 40, right = 41 }, -- ()
        { left = 91, right = 93 }, -- []
        { left = 123, right = 125 }, -- {}
        { left = 34, right = 34 }, -- ""
        { left = 39, right = 39 }, -- ''
        { left = 96, right = 96 }, -- ``
        { left = 36, right = 123 }, -- ${ (模板字符串)
      },
    },
  },
}
