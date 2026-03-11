-- ~/.config/nvim/lua/plugins/markdown.lua
--
return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    -- build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      -- 配置选项
      -- light
      vim.g.mkdp_theme = "light" -- 暗色主题
      vim.g.mkdp_browser = "" -- 使用默认浏览器
      vim.g.mkdp_port = "" -- 随机端口
      vim.g.mkdp_page_title = "${name}"

      -- 禁用 vim-markdown 插件的隐藏功能
      vim.g.vim_markdown_conceal = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_math = 0
      vim.g.vim_markdown_conceal_url = 0

      -- 自动命令：退出时关闭预览
      vim.api.nvim_create_autocmd("VimLeave", {
        pattern = "*",
        callback = function()
          vim.fn["mkdp#util#stop_preview"]()
        end,
      })
    end,
  },

  -- 可选：Markdown 语法增强
  {
    "preservim/vim-markdown",
    ft = "markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 0
    end,
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft["markdown"] = { "markdownlint-cli2" }

      -- 配置 linter 参数
      opts.linters = opts.linters or {}
      opts.linters["markdownlint-cli2"] = {
        args = {
          "--config",
          vim.fn.expand("~/.config/nvim/lua/plugins/.markdownlint-cli2.json"),
          "--",
        },
      }

      return opts
    end,
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = function(_, opts)
  --     local markdownlint = require("lint").linters["markdownlint-cli2"]
  --
  --     -- 指向全局配置
  --     markdownlint.prepend_args = {
  --       "--config",
  --       vim.fn.expand("~/.config/nvim/lua/plugins/.markdownlint-cli2.json"),
  --       "--",
  --     }
  --
  --     return opts
  --   end,
  -- },
}
