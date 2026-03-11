-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- 全局快捷键
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- 标签页管理
-- 默认使用自带的gt gT命令来控制 tabnext tabnew tabprevious tabclose
-- " 缓冲区导航
-- vim.keymap.set("n", "gt", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Tab" })
-- vim.keymap.set("n", "gT", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>t1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Tab 1" })
vim.keymap.set("n", "<leader>t2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Tab 2" })
vim.keymap.set("n", "<leader>t3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Tab 3" })
vim.keymap.set("n", "<leader>t4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Tab 4" })
vim.keymap.set("n", "<leader>t5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Tab 5" })
vim.keymap.set("n", "<leader>t6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Tab 6" })
vim.keymap.set("n", "<leader>t7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Tab 7" })

-- 快速打开配置文件
-- vim.keymap.set("n", "<leader>vc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit Neovim config" })
-- vim.keymap.set("n", "<leader>vr", ":source ~/.config/nvim/init.lua<CR>", { desc = "Reload Neovim config" })

-- 增强的复制粘贴
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before from system clipboard" })
