{ lib, pkgs, config, ... }:

let
  hyprbar =
    "com-abdownloadmanager-desktop-AppKt|floorp|codium|ONLYOFFICE|org.vinegarhq.Sober|hyprpolkitagent|scrcpy|dragon-drop|Blockbench|hyprland-share-picker|obsidian|gale|shiru|zen.*|steam||org.kde.plasmawindowed|localsend|swayimg.*|nz.co.mega.megasync|org.quickshell|"
    + ".*gnome.*|xdg-desktop-portal-gtk|be.alexandervanhee.gradia|.*[Kk]ooha|.*bottles|io.github.giantpinkrobots.varia|com.mitchellh.ghostty|GTK Application|net.lutris.Lutris|com.vysp3r.ProtonPlus|de.haeckerfelix.Fragments";
in
{
  wayland.windowManager.hyprland = {
    settings = {

      "$pip_coord" = "(monitor_w*0.75) (monitor_h*0.75)";

      windowrule = [

        # Tile
        "match:class Godot match:initial_title Godot, tile on"
        "match:class jetbrains-.*, match:initial_title ^$, tile on"
        "match:class Aseprite, tile on"
        "match:title Pizza Oven, tile on"

        # Float
        "match:class guifetch, float on"
        "match:class yad, float on"
        "match:class zenity,float on"
        "match:class wev, float on"
        "match:class org\.gnome\.FileRoller, float on"
        "match:class file-roller, float on"
        "match:class blueman-manager, float on"
        "match:class com\.github\.GradienceTeam\.Gradience, float on"
        "match:class feh, float on"
        "match:class imv, float on"
        "match:class system-config-printer, float on"
        "match:class org.freedesktop.impl.portal.desktop.kde, float on"
        "match:class xdg-desktop-portal-gtk, float on"
        "match:class nz.co.mega.megasync, float on"
        "match:class delta-patcher, float on"
        "match:class limo, match:title (.*[Mm]od.*|New.*|[Aa]dd.*|Import.*|Edit.*|.*[Dd]eployer.*|Settings), float on"
        "match:class .*Windows.*, float on"
        "match:class hyprland-share-picker, float on"
        "match:class be.alexandervanhee.gradia, float on"
        "match:class qalculate-gtk, float on"
        "match:class com-abdownloadmanager-desktop-AppKt, match:title Add Download, float on"
        "match:class org.quickshell, float on"
        "match:title Select what to share, float on"
        # Float and resize
        "match:class org\.gnome\.Settings, float on"
        "match:class org\.gnome\.Settings, size 70% 80%"
        "match:class org\.gnome\.Settings, center 1"
        "match:class org\.pulseaudio\.pavucontrol|yad-icon-browser, float on"
        "match:class org\.pulseaudio\.pavucontrol|yad-icon-browser, size 60% 70%"
        "match:class org\.pulseaudio\.pavucontrol|yad-icon-browser, center 1"
        "match:class nwg.*, float on"
        "match:class nwg.*, size 50% 60%"
        "match:class .*scrcpy.*, float on"
        #match:class .*scrcpy.*, "size 100%-w-10% 100%-w-10%"
        #match:class .*scrcpy.*, "move 2023 240"
        "match:class .*scrcpy.*, keep_aspect_ratio on"
        "match:title terminal-(filechooser|filepicker), float on"
        "match:title terminal-(filechooser|filepicker), size (monitor_w*0.65) (monitor_h*0.61)"
        "match:class net.lutris.Lutris, match:title ^(Log for.*), float on"

        # Special workspace
        "match:class btop, workspace special:sysmon"
        "match:class feishin|Spotify|Supersonic, workspace special:music"
        "match:initial_title Spotify( Free)?, workspace special:music"
        "match:class discord|equibop|vesktop|whatsapp|BeeperTexts, workspace special:chat"
        "match:class shijima-qt, workspace special:shijima"

        # Dialogs
        "match:title (Select|Open)( a)? (File|Folder)(s)?, float on"
        "match:title File (Operation|Upload)( Progress)?, float on"
        "match:title .* Properties, float on"
        "match:title Export Image as PNG, float on"
        "match:title GIMP Crash Debug, float on"
        "match:title Save As, float on"
        "match:title Library, float on"

        # Picture in picture
        "match:title Picture(-| )in(-| )[Pp]icture, move $pip_coord"
        "match:title Picture(-| )in(-| )[Pp]icture, keep_aspect_ratio on"
        "match:title Picture(-| )in(-| )[Pp]icture, float on"
        "match:title Picture(-| )in(-| )[Pp]icture, pin on"

        "match:initial_title (Discord Popout), move $pip_coord"
        "match:initial_title (Discord Popout), keep_aspect_ratio on"
        "match:initial_title (Discord Popout), float on"
        "match:initial_title (Discord Popout), pin on"

        # Steam
        #"match:class steam, match:title , rounding 10"
        "match:class steam, match:title Friends List, float on"
        "match:class steam_app_[0-9]+, immediate on"
        "match:class steam_app_[0-9]+, idle_inhibit always"

        # xwayland bs
        "match:title win[0-9]+, match:xwayland 1, no_dim on"
        "match:title win[0-9]+, match:xwayland 1, no_shadow on"
        "match:title win[0-9]+, match:xwayland 1, rounding 10"

        # Swayimg
        "match:class ^(swayimg.*), no_blur on"
        # "match:class ^(swayimg.*), no_border on"
      ]
      # Hyprbars
      ++ lib.optional (lib.lists.any (x: x == pkgs.hyprlandPlugins.hyprbars) config.wayland.windowManager.hyprland.plugins)
        [
        "match:class ${hyprbar}, hyprbars:no_bar on"
        "match:class (jetbrains-.*), match:initial_title ^(?:(?! ).)*$, hyprbars:no_bar on"
        "match:initial_title Discord Popout, hyprbars:no_bar on"
        ]
      ;

      "$blur_modal" =
        "dms:(modal|polkit|keybinds|notification-center-modal|workspace-overview|color-picker|clipboard|process-list-modal)";
      layerrule = [
        # Animation
        "match:namespace dms:color-picker, no_anim on"
        "match:namespace dms:(control-center|notification-center-popout|battery), animation slide left"
        "match:namespace dms:(dash|tray-menu-window|toast|system-update|process-list-popout|popout), animation slide top"
        "match:namespace dms:(dock|dock-context-menu|osd), animation slide bottom"
        "match:namespace dms:app-launcher, animation slide left"
        "match:namespace dms:workspace-overview, animation slide top"
        "match:namespace dms:tooltip, animation fade"
        "match:namespace dms:(modal|confirm-modal|polkit|keybinds|power-menu|notification-center-modal|color-picker|clipboard|spotlight|settings|process-list-modal), animation fade"
        "match:namespace dms-plugin:(plugin), animation slide,"
        # Blur
        "match:namespace $blur_modal, blur on"
        "match:namespace $blur_modal, animation fade"
        "match:namespace $blur_modal, animation popin"

        "match:namespace dms:(notification-.*), no_screen_share on"

        "match:namespace (hyprpicker|selection), no_anim on"
      ];
    };
  };
}
