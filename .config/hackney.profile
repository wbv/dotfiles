# custom environment for hackney

# force wayland (instead of xwayland) for QT, FireFox, etc.
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1
export XDG_CURRENT_DESKTOP=sway
