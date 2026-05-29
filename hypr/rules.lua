-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- floating windows
hl.window_rule({
    name  = "floating monitor",
    match = {
        class = "^(floating-monitor)$",
    },
    float = true,
    size  = { 1200, 800 }
})

-- Wofi app launcher
hl.window_rule({
    name         = "wofi-launcher",
    match        = {
        class = "^(wofi)$",
    },
    float        = true,
    center       = true,
    stay_focused = true,
    pin          = true,
})


hl.window_rule({
    name         = "alttab-behavior",
    match        = {
        class = "alttab",
    },
    no_anim      = true,
    stay_focused = true,
    workspace    = "special:alttab",
    border_size  = 0
})

-- Steam games
hl.window_rule({
    name             = "steam-games",
    match            = {
        class = "^(steam_app_.*)$",
    },
    workspace        = "2 silent",
    immediate        = true,
    fullscreen       = true,
    fullscreen_state = 3,
})
