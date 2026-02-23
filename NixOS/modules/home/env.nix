{
  home.sessionVariables = {
    QT_QPA_PLATFORM =  "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";

    GDK_DEBUG = "portals";
    GTK_USE_PORTAL = 1;

    APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";

    # MOZ_LEGACY_PROFILES = 1;

    # GDK_BACKEND = "wayland,x11";
    # SDL_VIDEODRIVER = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # XDG_CURRENT_DESKTOP = "niri"; #"Hyprland";
    XDG_SESSION_TYPE = "wayland";
    # XDG_SESSION_DESKTOP = "Hyprland";

    _JAVA_AWT_WM_NONREPARENTING = 1;
  };
}
