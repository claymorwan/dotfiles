{ ... }:

{
  wayland.windowManager.hyprland = {
    settings = {

    	"$blur_modal" = "dms:(polkit|keybinds|notification-center-modal|workspace-overview|color-picker|clipboard|spotlight|settings|process-list-modal)";

      windowrule = [
        # Tile
				"tile, class:Godot, initialTitle:Godot"
				"tile, class:jetbrains-.*, initialTitle:^$"
				"tile, class:Aseprite"
				
				# Float
				"float, class:guifetch"
				"float, class:yad"
				"float, class:zenity"
				"float, class:wev"
				"float, class:org\.gnome\.FileRoller"
				"float, class:file-roller"
				"float, class:blueman-manager"
				"float, class:com\.github\.GradienceTeam\.Gradience"
				"float, class:feh"
				"float, class:imv"
				"float, class:system-config-printer"
				"float, class:org.freedesktop.impl.portal.desktop.kde"
				"float, class:xdg-desktop-portal-gtk"
				"float, class:nz.co.mega.megasync"
				"float, class:delta-patcher"
				"float, class:limo, title:(.*[Mm]od.*|New.*|[Aa]dd.*|Import.*|Edit.*|.*[Dd]eployer.*|Settings)"
				"float, class:.*Windows.*"
				"float, class:hyprland-share-picker"
				"float, class:be.alexandervanhee.gradia"
				"float, class:qalculate-gtk"
				"float, class:com-abdownloadmanager-desktop-AppKt, title:Add Download"
				"float, class:org.quickshell"
				"float, title:Select what to share"
				# Float and resize
				"float, class:org\.gnome\.Settings"
				"size 70% 80%, class:org\.gnome\.Settings"
				"center 1, class:org\.gnome\.Settings"
				"float, class:org\.pulseaudio\.pavucontrol|yad-icon-browser"
				"size 60% 70%, class:org\.pulseaudio\.pavucontrol|yad-icon-browser"
				"center 1, class:org\.pulseaudio\.pavucontrol|yad-icon-browser"
				"float, class:nwg.*"
				"size 50% 60%, class:nwg.*"
				"float,  class:.*scrcpy.*"
				"size 302 673, class:scrcpy"
				"keepaspectratio, class:scrcpy"
				"float, title:terminal-filechooser"
				"size 65% 61%, title:terminal-filechooser"
				"float, class:net.lutris.Lutris, title:^(Log for.*)"

				# Special workspace
				"workspace special:sysmon, class:btop"
				"workspace special:music, class:feishin|Spotify|Supersonic"
				"workspace special:music, initialTitle:Spotify( Free)?"
				"workspace special:communication, class:discord|equibop|vesktop|whatsapp|BeeperTexts"
				"workspace special:shijima, class:shijima-qt"

				# Dialogs
				"float, title:(Select|Open)( a)? (File|Folder)(s)?"
				"float, title:File (Operation|Upload)( Progress)?"
				"float, title:.* Properties"
				"float, title:Export Image as PNG"
				"float, title:GIMP Crash Debug"
				"float, title:Save As"
				"float, title:Library"

				# Picture in picture
				"move 100%-w-2% 100%-w-3%, title:Picture(-| )in(-| )[Pp]icture"
				"keepaspectratio, title:Picture(-| )in(-| )[Pp]icture"
				"float, title:Picture(-| )in(-| )[Pp]icture"
				"pin, title:Picture(-| )in(-| )[Pp]icture"

				# Steam
				"rounding 10, title:, class:steam"
				"float, title:Friends List, class:steam"
				"immediate, class:steam_app_[0-9]+"
				"idleinhibit always, class:steam_app_[0-9]+"

				# xwayland bs
				"nodim, xwayland:1, title:win[0-9]+"
				"noshadow, xwayland:1, title:win[0-9]+"
				"rounding 10, xwayland:1, title:win[0-9]+"

				# Hyprbar
				"plugin:hyprbars:nobar, class:(com-abdownloadmanager-desktop-AppKt|floorp|codium|ONLYOFFICE|org.vinegarhq.Sober|hyprpolkitagent|scrcpy|dragon-drop|Blockbench|hyprland-share-picker|obsidian|gale|shiru|zen.*|steam||org.kde.plasmawindowed|localsend|swayimg.*|nz.co.mega.megasync|org.quickshell)"
				"plugin:hyprbars:nobar, class:(.*gnome.*|xdg-desktop-portal-gtk|be.alexandervanhee.gradia|.*[Kk]ooha|.*bottles|io.github.giantpinkrobots.varia|com.mitchellh.ghostty|GTK Application|net.lutris.Lutris|com.vysp3r.ProtonPlus|de.haeckerfelix.Fragments)"
        "plugin:hyprbars:nobar, class:(jetbrains-.*), initialTitle:^(?:(?! ).)*$ #title:(splash|win.*|Third-Party Plugins Notice)"
				
				# Swayimg
				"noblur, class:^(swayimg.*)"
				"noborder, class:^(swayimg.*)"
      ];

      layerrule = [
				# Animation
				"noanim, dms:color-picker"
        "animation slide right, dms:(control-center|notification-center-popout|battery)"
				"animation slide top, dms:(dash|tray-menu-window|toast|system-update|process-list-popout|popout)"
				"animation slide bottom, dms:(dock|dock-context-menu|osd)"
				"animation slide left, dms:app-launcher"
				"animation slide top, dms:workspace-overview"
				"animation fade, dms:tooltip"
				"animation fade, dms:(modal|confirm-modal|polkit|keybinds|power-menu|notification-center-modal|color-picker|clipboard|spotlight|settings|process-list-modal)"

				# Blur
				# "blur, $blur_modal"
				"animation fade, $blur_modal"

				"noscreenshare, dms:(notification-.*)"

				"noanim, (hyprpicker|selection)"
      ];
    };
  };
}
