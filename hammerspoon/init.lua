-- Terminal.app Hotkey Toggle (ctrl + q)
-- Uses bundleID to avoid localized app-name issues

-- local terminalBundleID = "com.googlecode.iterm2"
local terminalBundleID = "com.apple.Terminal"

hs.hotkey.bind({"ctrl"}, "q", function()
  local front = hs.application.frontmostApplication()

  -- If Terminal is frontmost, hide it
  if front and front:bundleID() == terminalBundleID then
    front:hide()
    return
  end

  -- Otherwise, show (launch or focus) Terminal
  hs.application.launchOrFocusByBundleID(terminalBundleID)
end)

-- =========================
-- Screen selection
-- =========================

local function primaryScreen()
  return hs.screen.primaryScreen()
end

local function secondaryScreen()
  local p = primaryScreen()
  local screens = hs.screen.allScreens()
  if #screens < 2 then
    return nil
  end

  for _, s in ipairs(screens) do
    if s:id() ~= p:id() then
      return s -- primary 以外は1枚のはず、最初に見つかったものを返す
    end
  end
  return nil
end

-- =========================
-- Window operations
-- =========================

local function frontWindow()
  return hs.window.frontmostWindow()
end

local function moveAndResize(win, screen, rect)
  if not win or not screen then return end
  win:moveToScreen(screen, true)
  local f = screen:frame()
  win:setFrame({
    x = f.x + rect.x,
    y = f.y + rect.y,
    w = rect.w,
    h = rect.h
  })
end

local function maximizeOnScreen(screenGetter)
  local win = hs.window.frontmostWindow()
  if not win then return end

  local s = screenGetter()
  if not s then
    hs.alert.show("Target screen not found")
    return
  end

  win:moveToScreen(s, false)
  win:setFrame(s:frame()) -- 作業領域いっぱい（フルスクリーンではない）
end

local function layoutHalf(screenGetter, pos)
  local win = frontWindow()
  local s = screenGetter()
  if not s then
    hs.alert.show("Target screen not found")
    return
  end
  local f = s:frame()

  if pos == "left" then
    moveAndResize(win, s, { x = 0, y = 0, w = f.w / 2, h = f.h })
  elseif pos == "right" then
    moveAndResize(win, s, { x = f.w / 2, y = 0, w = f.w / 2, h = f.h })
  elseif pos == "top" then
    moveAndResize(win, s, { x = 0, y = 0, w = f.w, h = f.h / 2 })
  elseif pos == "bottom" then
    moveAndResize(win, s, { x = 0, y = f.h / 2, w = f.w, h = f.h / 2 })
  end
end

-- =========================
-- Prefix (modal) commands
-- =========================

local function modalWithTimeout(modal, seconds)
  if modal._timeoutTimer then
    modal._timeoutTimer:stop()
  end
  modal._timeoutTimer = hs.timer.doAfter(seconds, function()
    if modal then modal:exit() end
  end)
end

local primaryMode = hs.hotkey.modal.new({"ctrl"}, "s")
function primaryMode:entered()
  modalWithTimeout(primaryMode, 1.0)
end
function primaryMode:exited()
  if primaryMode._timeoutTimer then
    primaryMode._timeoutTimer:stop()
    primaryMode._timeoutTimer = nil
  end
end

primaryMode:bind("", "s", function()
  maximizeOnScreen(primaryScreen); primaryMode:exit()
end)

primaryMode:bind("", "h", function()
  layoutHalf(primaryScreen, "left"); primaryMode:exit()
end)
primaryMode:bind("", "j", function()
  layoutHalf(primaryScreen, "bottom"); primaryMode:exit()
end)
primaryMode:bind("", "k", function()
  layoutHalf(primaryScreen, "top"); primaryMode:exit()
end)
primaryMode:bind("", "l", function()
  layoutHalf(primaryScreen, "right"); primaryMode:exit()
end)

primaryMode:bind("", "escape", function() primaryMode:exit() end)


local secondaryMode = hs.hotkey.modal.new({"ctrl"}, "w")
function secondaryMode:entered()
  modalWithTimeout(secondaryMode, 1.0)
end
function secondaryMode:exited()
  if secondaryMode._timeoutTimer then
    secondaryMode._timeoutTimer:stop()
    secondaryMode._timeoutTimer = nil
  end
end

secondaryMode:bind("", "w", function()
  maximizeOnScreen(secondaryScreen); secondaryMode:exit()
end)

secondaryMode:bind("", "h", function()
  layoutHalf(secondaryScreen, "left"); secondaryMode:exit()
end)
secondaryMode:bind("", "j", function()
  layoutHalf(secondaryScreen, "bottom"); secondaryMode:exit()
end)
secondaryMode:bind("", "k", function()
  layoutHalf(secondaryScreen, "top"); secondaryMode:exit()
end)
secondaryMode:bind("", "l", function()
  layoutHalf(secondaryScreen, "right"); secondaryMode:exit()
end)

secondaryMode:bind("", "escape", function() secondaryMode:exit() end)
