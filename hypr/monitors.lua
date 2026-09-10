-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "2560x1440",
    position = "2560x0",
    scale    = 1,
})

-- Bind workspaces 1, 2, and 3 to DP-1
hl.workspace_rule({
    workspace = "1",
    monitor = "DP-1",
    default = true,
})

hl.workspace_rule({
    workspace = "2",
    monitor = "DP-1",
})

hl.workspace_rule({
    workspace = "3",
    monitor = "DP-1",
})

-- Bind workspaces 4, 5, and 6 to HDMI-A-1
hl.workspace_rule({
    workspace = "4",
    monitor = "HDMI-A-1",
    default = true,
})

hl.workspace_rule({
    workspace = "5",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "6",
    monitor = "HDMI-A-1",
})
