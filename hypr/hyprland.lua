hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")


-- load sub-confs
require("monitors")
require("devices")
require("premissions")
require("looknfeel")
require("rules")
require("apps")
require("bindings")
