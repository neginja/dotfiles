local pv = require("priv_vars")


-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"
local hyper = "MOD3"

hl.bind(hyper .. " + Return", hl.dsp.exec_cmd(pv.terminal))
hl.bind(hyper .. " + Backspace", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("XDG_CURRENT_DESKTOP=kde " .. pv.fileManager))

-- launcher
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("CTRL + SHIFT + M", hl.dsp.exec_cmd(pv.powermenu))

-- --- Window Manipulation ---
-- Swapping windows
hl.bind(hyper .. " + bracketleft", hl.dsp.window.swap({ direction = "left" }))
hl.bind(hyper .. " + bracketright", hl.dsp.window.swap({ direction = "right" }))
hl.bind(hyper .. " + equal", hl.dsp.window.swap({ direction = "up" }))
hl.bind(hyper .. " + apostrophe", hl.dsp.window.swap({ direction = "down" }))

-- Toggle Fullscreen / Floating / Sticky
hl.bind(hyper .. " + Q", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(hyper .. " + Space", hl.dsp.window.float())
-- drag with left click
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- resize with right click
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Split configuration
hl.bind(hyper .. " + R", hl.dsp.layout("swapsplit"))
hl.bind(hyper .. " + T", hl.dsp.layout("togglesplit"))

-- Window Rotation & Mirroring
hl.bind(hyper .. " + R", hl.dsp.layout("togglesplit"))
hl.bind(hyper .. " + V", hl.dsp.layout("preselect d"))
hl.bind(hyper .. " + H", hl.dsp.layout("preselect r"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --- Workspace Management ---
-- Focus Workspace (Hyper + 1-9)
hl.bind(hyper .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(hyper .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(hyper .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(hyper .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(hyper .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(hyper .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(hyper .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(hyper .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(hyper .. " + 9", hl.dsp.focus({ workspace = 10 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move Window to Workspace (Alt + Cmd + 1-9)
hl.bind("ALT + SUPER + 1", hl.dsp.window.move({ workspace = "1", follow = true }))
hl.bind("ALT + SUPER + 2", hl.dsp.window.move({ workspace = "2", follow = false }))
hl.bind("ALT + SUPER + 3", hl.dsp.window.move({ workspace = "3", follow = false }))
hl.bind("ALT + SUPER + 4", hl.dsp.window.move({ workspace = "4", follow = true }))
hl.bind("ALT + SUPER + 5", hl.dsp.window.move({ workspace = "5", follow = false }))
hl.bind("ALT + SUPER + 6", hl.dsp.window.move({ workspace = "6", follow = false }))
hl.bind("ALT + SUPER + 7", hl.dsp.window.move({ workspace = "7", follow = false }))
hl.bind("ALT + SUPER + 8", hl.dsp.window.move({ workspace = "8", follow = false }))
hl.bind("ALT + SUPER + 9", hl.dsp.window.move({ workspace = "9", follow = false }))

-- Move Window to Monitor (Ctrl + Cmd + 1-3)
hl.bind("CTRL + SUPER + 1", hl.dsp.window.move({ monitor = "DP-1", follow = true }))
hl.bind("CTRL + SUPER + 2", hl.dsp.window.move({ monitor = "HDMI-A-1", follow = true }))
hl.bind("CTRL + SUPER + 3", hl.dsp.window.move({ monitor = "2", follow = true }))

-- --- Multimedia keys and other functions ---
-- Multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2.5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2.5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
-- bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
-- bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- --- AltTab behavior ---

--https://wiki.hypr.land/Configuring/Uncommon-tips--tricks/#alt-tab-behaviour
-- hl.bind("ALT + TAB", hl.dsp.exec_cmd("local_var_HOME/.config/hypr/scripts/alttab/enable.sh 'down'"))
-- hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("local_var_HOME/.config/hypr/scripts/alttab/enable.sh 'up'"))
-- hl.define_submap("alttab", function()
-- hl.bind("ALT + tab", hl.dsp.send_shortcut("", "tab", "class:alttab"))
-- hl.bind("ALT + SHIFT + tab", hl.dsp.send_shortcut("shift", "tab", "class:alttab"))
-- hl.bind("ALT + ALT_L",
-- hl.dsp.exec_cmd(
-- "local_var_HOME/.config/hypr/scripts/alttab/disable.sh ; hyprctl -q dispatch sendshortcut,return,class:alttab"),
-- { repeating = true, transparent = true })
-- hl.bind("ALT + SHIFT + ALT_L",
-- hl.dsp.exec_cmd(
-- "local_var_HOME/.config/hypr/scripts/alttab/disable.sh ; hyprctl -q dispatch sendshortcut,return,class:alttab"),
-- { repeating = true, transparent = true })
-- hl.bind("ALT + Return",
-- hl.dsp.exec_cmd(
-- "local_var_HOME/.config/hypr/scripts/alttab/disable.sh ; hyprctl -q dispatch sendshortcut,return,class:alttab"))
-- hl.bind("ALT + SHIFT + Return",
-- hl.dsp.exec_cmd(
-- "local_var_HOME/.config/hypr/scripts/alttab/disable.sh ; hyprctl -q dispatch sendshortcut,return,class:alttab"))
-- hl.bind("ALT + escape",
-- hl.dsp.exec_cmd(
-- "local_var_HOME/.config/hypr/scripts/alttab/disable.sh ; hyprctl -q dispatch sendshortcut,escape,class:alttab"))
-- hl.bind("ALT + SHIFT + escape",
-- hl.dsp.exec_cmd(
-- "local_var_HOME/.config/hypr/scripts/alttab/disable.sh ; hyprctl -q dispatch sendshortcut,escape,class:alttab"))
-- end)

hl.bind("ALT + TAB", hl.dsp.exec_cmd("snappy-switcher next"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("snappy-switcher prev"))

-- Screenshots
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Autoclick
hl.bind(hyper .. " + mouse:274",
    hl.dsp.exec_cmd("YDOTOOL_SOCKET=/home/neginja/.ydotool_socket ydotool click --repeat 100 --next-delay 5 0xC0"))

-- hyprpicker
hl.bind("SUPER + C", hl.dsp.exec_cmd("hyprpicker -a --format=rgb -o '({0}, {1}, {2})'"))
