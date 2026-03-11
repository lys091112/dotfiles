-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true
vim.opt.relativenumber = false -- 显示相对行号

-- 高亮当前列
vim.opt.cursorcolumn = true
-- vim.opt.cursorline = true

vim.opt.wrap = true -- 启用自动换行
vim.opt.linebreak = true -- 智能单词边界换行

vim.opt.clipboard = "unnamedplus" -- 使用系统剪贴板

vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

-- vim.opt.spell = false
-- set nospell 手动关闭拼写检查
