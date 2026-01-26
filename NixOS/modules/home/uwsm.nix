{ ... }:

let
  inherit (import ./../../variables)
    mouse_cursor
    ;
in
{
  home.file.".config/uwsm/env".text = ''
    # ############# Themes #############
    export QT_QPA_PLATFORM='wayland'
    export QT_QPA_PLATFORMTHEME='qt6ct'
    # export QT_STYLE_OVERRIDE='kvantum'
    export QT_WAYLAND_DISABLE_WINDOWDECORATION='1'
    export QT_AUTO_SCREEN_SCALE_FACTOR='1'
    # export XCURSOR_THEME='${mouse_cursor}-X'
    # export XCURSOR_SIZE='24'

    export XDG_DESKTOP_PORTAL_DIR=/etc/profiles/per-user/claymorwan/share/xdg-desktop-portal/portals
    export GDK_DEBUG=portals
    export GTK_USE_PORTAL=1

    # ###### app2unit Integration ######
    export APP2UNIT_SLICES='a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice'

    #export EDITOR=nvim
    export MOZ_LEGACY_PROFILES=1
    export KRITA_NO_STYLE_OVERRIDE=1
  '';

  home.file.".config/uwsm/env-hyprland".text = ''
    # ######## Toolkit backends ########
    export GDK_BACKEND='wayland,x11'
    export QT_QPA_PLATFORM='wayland;xcb'
    export SDL_VIDEODRIVER='wayland,x11'
    export CLUTTER_BACKEND='wayland'
    export ELECTRON_OZONE_PLATFORM_HINT='auto'

    # ####### XDG specifications #######
    export XDG_CURRENT_DESKTOP=Hyprland
    export XDG_SESSION_TYPE=wayland
    export XDG_SESSION_DESKTOP=Hyprland

    # ############# Others #############
    export _JAVA_AWT_WM_NONREPARENTING=1
  '';
}
