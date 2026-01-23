local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- カラースキーム（Catppuccin Mocha ベース、後でカスタマイズ可能）
config.color_scheme = 'Catppuccin Mocha'

-- フォント設定（Ricty + 日本語フォールバック）
config.font = wezterm.font_with_fallback({
  'Ricty',
  'Hiragino Sans',  -- macOS標準の日本語フォント
})
config.font_size = 14.0

-- タブバー：2つ以上のタブがあるときのみ表示
config.hide_tab_bar_if_only_one_tab = true

-- スクロールバック：実質無制限
config.scrollback_lines = 1000000

-- 設定自動リロード
config.automatically_reload_config = true

-- ビープ音オフ
config.audible_bell = 'Disabled'

-- キーバインド
config.keys = {
  -- Shift + Enter で改行を送信（Claude Code用）
  { key = 'Enter', mods = 'SHIFT', action = wezterm.action.SendString('\n') },
  -- Cmd + K でスクロールバックとビューポートをクリア（Ctrl+L でプロンプト再描画）
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.Multiple {
      wezterm.action.ClearScrollback('ScrollbackAndViewport'),
    },
  },
  -- Ctrl + R で透過率トグル (100% <-> 50%)
  {
    key = 'r',
    mods = 'CMD',
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      if overrides.window_background_opacity == 0.5 then
        overrides.window_background_opacity = 1.0
      else
        overrides.window_background_opacity = 0.5
      end
      window:set_config_overrides(overrides)
    end),
  },
}

config.window_padding = { left = 15, right = 0, top = 0, bottom = 0 }
config.enable_scroll_bar = false
config.window_decorations = 'RESIZE'  -- タイトルバーを非表示（リサイズは可能）

-- タブ名をカレントディレクトリ名に設定
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local cwd = pane.current_working_dir
  if cwd then
    local dir_name = cwd.file_path:match("([^/]+)/?$")
    return dir_name or cwd.file_path
  end
  -- cwd が取得できない場合もプロセス名は使わずフォールバック
  return "shell"
end)

return config
