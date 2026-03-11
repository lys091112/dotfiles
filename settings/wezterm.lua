-- 参考： https://zhuanlan.zhihu.com/p/1973514411802108537
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 基础窗口设置
config.initial_cols = 120
config.initial_rows = 30
config.font_size = 13.0

-- font
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Fira Code",
	"Noto Color Emoji",
})
config.line_height = 1.2

-- 热门配色方案推荐
-- config.color_scheme = "Catppuccin Mocha"  -- 柔和舒适
config.color_scheme = "Dracula" -- 经典暗色
-- config.color_scheme = "GitHub Dark"   -- 现代风格

config.window_background_opacity = 0.85 -- 85%不透明度
config.text_background_opacity = 1.0 -- 文字背景不透明度
--
-- 窗口样式
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = {
	active_titlebar_bg = "#090909",
	inactive_titlebar_bg = "#090909",
}
config.integrated_title_button_alignment = "Right"
config.integrated_title_button_style = "Windows"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.window_close_confirmation = "NeverPrompt"

-- 标签栏和配色
-- 默认关闭标签栏
config.enable_tab_bar = true
config.show_new_tab_button_in_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.tab_max_width = 25
config.use_fancy_tab_bar = true
config.colors = {
	scrollbar_thumb = "#242936",
	tab_bar = {
		active_tab = { bg_color = "#090909", fg_color = "#ff6565" },
		inactive_tab = { bg_color = "#090909", fg_color = "#95e6cb" },
		inactive_tab_hover = { bg_color = "#0f1419", fg_color = "#95e6cb" },
		new_tab = { bg_color = "#090909", fg_color = "#95e6cb" },
		new_tab_hover = { bg_color = "#42a5f5", fg_color = "#ffffff" },
	},
	-- 分屏线颜色 - 使用醒目的颜色
	split = "#81d8d0", -- 青色，容易识别
	-- 光标颜色
	cursor_bg = "#7aa2f7",
	cursor_border = "#7aa2f7",
	-- 选中文本颜色
	selection_bg = "#313244",
	selection_fg = "#c0caf5",
}
-- 非活动窗口样式（让分屏效果更明显）
config.inactive_pane_hsb = {
	saturation = 0.5, -- 降低饱和度
	brightness = 0.9, -- 降低亮度
}

-- 窗口内边距（让分屏线更清晰）
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

-- 调整字体样式时，不自动调整窗口大小
config.adjust_window_size_when_changing_font_size = false

-- 跨平台设置
if wezterm.target_triple:find("windows") then
	config.default_prog = { "pwsh", "-NoLogo" }
elseif wezterm.target_triple:find("apple") then
	config.macos_window_background_blur = 20
else
	config.enable_wayland = true
end

-- 窗口操作
-- 按下快捷键后，需要先释放LEADER,然后再按key键
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1500 }
config.disable_default_key_bindings = false

config.keys = {
	-- 窗格分割
	{ key = "|", mods = "LEADER|SHIFT", action = wezterm.action.SplitHorizontal },
	-- { key = 'F1', action = wezterm.action.SplitHorizontal },
	--{ key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical },
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical },

	-- Leader + Home/End:快速滚动到顶部/底部
	{ key = "Home", mods = "LEADER", action = wezterm.action.ScrollToTop },
	{ key = "End", mods = "LEADER", action = wezterm.action.ScrollToBottom },

	-- Leader + f:搜索
	{ key = "f", mods = "LEADER", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
	-- Leader + p:打开 Launcher(类似 VS Code 命令面板)
	{ key = "p", mods = "LEADER", action = wezterm.action.ShowLauncher },
	-- Leader + c:清除滚动缓冲区
	{ key = "c", mods = "LEADER", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },

	-- 窗格切换
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },

	-- F11:切换全屏
	{ key = "F11", mods = "NONE", action = wezterm.action.ToggleFullScreen },
	-- Leader + m:隐藏窗口
	{ key = "m", mods = "LEADER", action = wezterm.action.Hide },
	-- Leader + n:新建标签页
	{ key = "n", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	-- Leader + w:关闭当前标签页(不确认)
	{ key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	-- Leader + Tab:切换到下一个标签页
	{ key = "Tab", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	-- ===== Alt+数字 跳转标签页 =====
	-- 使用 ActivateTab 并指定索引（从0开始）
	{ key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
	{ key = "0", mods = "ALT", action = wezterm.action.ActivateTab(-1) }, -- 最后一个标签页

	-- Ctrl + Shift + 方向键:调整窗格大小
	{ key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	-- Ctrl + Shift + W:关闭当前窗格(带确认)
	{ key = "w", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	-- Leader + t:切换标签栏显示 / 隐藏
	{ key = "t", mods = "LEADER", action = wezterm.action.EmitEvent("toggle-tab-bar") },
}

wezterm.on("toggle-tab-bar", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == nil then
		overrides.enable_tab_bar = false
	else
		overrides.enable_tab_bar = not overrides.enable_tab_bar
	end
	window:set_config_overrides(overrides)
end)

-- 启用GPU加速渲染
config.front_end = "WebGpu"

-- 性能参数调优
config.animation_fps = 60
config.max_fps = 60
config.scrollback_lines = 10000

-- 粘贴复制
config.disable_default_mouse_bindings = false
config.mouse_bindings = {
	{ -- 左键选择文本并复制到剪贴板
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("Clipboard"),
	},
	{ -- 右键粘贴剪贴板内容
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		-- 按住 Ctrl+Alt 拖动左键移动窗口
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "CTRL|ALT",
		action = wezterm.action.StartWindowDrag,
	},
	{
		-- 按住 Ctrl 点击左键打开超链接
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- 开启滚动条,并把 滚动缓冲区加大到 20000 行:
-- 自动重载配置
config.enable_scroll_bar = true
config.scrollback_lines = 20000
config.automatically_reload_config = true
-- config.exit_behavior = 'CloseOnCleanExit'
config.exit_behavior_messaging = "Verbose"
config.status_update_interval = 50000

return config
