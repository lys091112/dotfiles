-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- 添加 Go 专用自动命令
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function(args)
    local bufnr = args.buf

    -- Go 文件类型设置
    vim.bo[bufnr].shiftwidth = 4
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].softtabstop = 4
    vim.bo[bufnr].expandtab = false -- Go 使用制表符

    -- 保存时自动格式化
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          async = false,
          filter = function(client)
            return client.name == "gopls"
          end,
          timeout_ms = 5000,
        })
      end,
    })
  end,
})

-- 额外处理notice文件类型（如果有的话）
-- lua print(vim.bo.filtype) markdown被识别为了notice
vim.api.nvim_create_autocmd("FileType", {
  pattern = "notice",
  callback = function()
    -- 如果是.md文件但被识别为notice
    local filename = vim.api.nvim_buf_get_name(0)
    if filename:match("%.md$") then
      vim.bo.filetype = "markdown"
    else
      vim.bo.spell = false -- 真正的notice文件也不检查拼写
    end
  end,
})

-- 延迟执行确保最后
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- 延迟执行确保最后
    vim.defer_fn(function()
      -- 设置 autocmd
      vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
        pattern = "*.md",
        callback = function(args)
          -- 禁用拼写检查
          vim.opt_local.spell = false
          -- 即使开启也只检查英文
          vim.opt_local.spelllang = "en"
        end,
      })
      -- 修复已打开的文件
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "markdown" then
          -- 禁用拼写检查
          vim.opt_local.spell = false
          -- 即使开启也只检查英文
          vim.opt_local.spelllang = "en"
        end
      end
    end, 500) -- 延迟500ms
  end,
})
