# 记录配置

## 1 快捷键记录

在lazynvim中，可以通过<leader>sk来查看所有预设的快捷键

- snacks 浮窗切换， 快捷键是 <A-w> (Alt + w) 在各个窗口切换,可通过如下配置自定义：
```json
{
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            -- 在 input 窗口中使用 Ctrl+方向键切换窗口
            ["<C-h>"] = { "<C-w>h", expr = true, mode = { "i", "n" } },
            ["<C-j>"] = { "<C-w>j", expr = true, mode = { "i", "n" } },
            ["<C-k>"] = { "<C-w>k", expr = true, mode = { "i", "n" } },
            ["<C-l>"] = { "<C-w>l", expr = true, mode = { "i", "n" } },
          },
        },
        -- 如果需要在 list 和 preview 窗口中也启用
        list = {
          keys = {
            ["<C-h>"] = { "<C-w>h", expr = true, mode = { "i", "n" } },
            ["<C-j>"] = { "<C-w>j", expr = true, mode = { "i", "n" } },
            ["<C-k>"] = { "<C-w>k", expr = true, mode = { "i", "n" } },
            ["<C-l>"] = { "<C-w>l", expr = true, mode = { "i", "n" } },
          },
        },
      },
    },
  },
}
```

- bufferline 标签页
    通过在normal模式下按键H L来进行标签页的左右切换， 非bufferline的标签页使用默认快捷键gt gT来切换



## 参考资料

- [lazynvim](https://www.lazyvim.org/plugins/ui)
- [blink.cmp](https://cmp.saghen.dev/configuration/keymap#super-tab)


