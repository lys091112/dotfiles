-- 保存为 ~/.config/nvim/lua/diagnose_clipboard.lua
-- 在 Neovim 中运行 :luafile ~/.config/nvim/lua/scripts/clipboard.lua

local M = {}

function M.run()
  print("=" .. string.rep("=", 50))
  print("📋 LazyVim 剪贴板问题诊断")
  print("=" .. string.rep("=", 50))
  print("")

  -- 1. 检查 Neovim 版本
  print("1️⃣ 检查 Neovim 版本:")
  local version_cmd = "nvim --version 2>/dev/null | head -5"
  local version_result = vim.fn.system(version_cmd)
  print(version_result)

  -- 检查关键特性
  local has_clipboard = vim.fn.has("clipboard")
  local has_wsl = vim.fn.has("wsl")
  local is_mac = vim.fn.has("mac")
  print("   has('clipboard'):", has_clipboard)
  print("   has('wsl'):", has_wsl)
  print("   has('mac'):", is_mac)

  -- 2. 检查系统
  print("")
  print("2️⃣ 检查操作系统:")
  local uname = vim.loop.os_uname()
  print("   系统:", uname.sysname)
  print("   版本:", uname.version)
  print("   架构:", uname.machine)

  -- 3. 检查环境
  print("")
  print("3️⃣ 检查环境变量:")
  local env_vars = { "DISPLAY", "WAYLAND_DISPLAY", "XDG_SESSION_TYPE", "SSH_CONNECTION" }
  for _, var in ipairs(env_vars) do
    local value = os.getenv(var)
    print("   " .. var .. ":", value or "未设置")
  end

  -- 4. 检查剪贴板工具
  print("")
  print("4️⃣ 检查剪贴板工具:")
  local tools = {
    "xclip",
    "xsel",
    "wl-copy",
    "wl-paste",
    "pbcopy",
    "pbpaste",
    "clip.exe",
    "win32yank.exe",
    "powershell.exe",
  }

  local found_tools = {}
  for _, tool in ipairs(tools) do
    if vim.fn.executable(tool) == 1 then
      table.insert(found_tools, tool)
      print("   ✓ " .. tool)
    end
  end

  if #found_tools == 0 then
    print("   ✗ 未找到任何剪贴板工具!")
  end

  -- 5. 检查 LazyVim 配置
  print("")
  print("5️⃣ 检查 LazyVim 配置:")
  print("   clipboard 选项:", vim.o.clipboard or "未设置")

  -- 6. 测试剪贴板
  print("")
  print("6️⃣ 测试剪贴板功能:")

  -- 测试复制
  local test_text = "LazyVim剪贴板测试" .. os.time()
  vim.fn.setreg("+", test_text)
  local clipboard_content = vim.fn.getreg("+")

  if clipboard_content == test_text then
    print("   ✓ 系统剪贴板工作正常")
  else
    print("   ✗ 系统剪贴板有问题")
    print("      期望: " .. test_text)
    print("      实际: " .. clipboard_content)
  end

  -- 7. 检查寄存器
  print("")
  print("7️⃣ 检查剪贴板寄存器:")
  vim.cmd("reg +")

  -- 8. 修复建议
  print("")
  print("8️⃣ 修复建议:")

  if uname.sysname == "Linux" then
    if os.getenv("WAYLAND_DISPLAY") then
      print("   Wayland 系统，请安装: sudo apt install wl-clipboard")
    else
      print("   X11 系统，请安装: sudo apt install xclip xsel")
    end
  elseif uname.sysname == "Darwin" then
    print("   macOS 系统，剪贴板应该自动工作")
  elseif uname.sysname == "Windows_NT" then
    print("   Windows 系统，请安装 win32yank")
  end

  if has_clipboard == 0 then
    print("   ❗ Neovim 编译时未包含剪贴板支持")
    print("   需要重新安装支持剪贴板的版本")
  end

  print("")
  print("=" .. string.rep("=", 50))
  print("诊断完成！请根据上面的建议进行修复")
  print("=" .. string.rep("=", 50))
end

-- pacman -S xclip 安装依赖

M.run()
