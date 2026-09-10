-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout = "us,ch",
        kb_variant = ",fr",
        kb_options = "caps:hyper,grp:shift_caps_toggle",
        follow_mouse = 1,
        numlock_by_default = true,
    },
})
hl.bind("MOD3 + SHIFT", hl.dsp.exec_cmd("hyprctl switchxkblayout @all next"))

hl.config({
    cursor = {
        no_hardware_cursors = 0,
        default_monitor = "DP-1"
        -- avoid weird issue with ghost cursor not disappearing
    },
})


hl.device({
    name = "logitech-gaming-mouse-g502",
    sensitivity = 1,
    accel_profile = "adaptive",
})
