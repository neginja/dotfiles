-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border = { colors = { "rgba(ade8f4ee)", "rgba(023e8aee)" }, angle = 45 },
            inactive_border = "rgba(90e0ef77)",
        },
        resize_on_border = false,
        -- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing = true,
        layout = "dwindle",
    },
    -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
    decoration = {
        rounding = 5,
        rounding_power = 2,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.90,
        -- shadow {
        --     enabled = true
        --     range = 4
        --     render_power = 3
        --     color = rgba(1a1a1aee)
        -- }
        -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
        -- blur {
        --     enabled = true
        --     size = 3
        --     passes = 1
        --     vibrancy = 0.1696
        -- }
    },
    --https://wiki.hypr.land/Configuring/Basics/Variables/#animations
    animations = {
        enabled = false,
    },
    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
    dwindle = {
        preserve_split = true,
    },
    -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    master = {
        new_status = "master",
    },
    -- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        focus_on_activate = false,
    },
    -- https://wiki.hypr.land/Configuring/Basics/Variables/#xwayland
    xwayland = {
        force_zero_scaling = true,
    },
})
