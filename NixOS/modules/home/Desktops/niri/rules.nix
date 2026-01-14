{
  programs.niri.settings = {
    workspaces = {
      "chat" = {};
      "shijima" = {};
    };
    window-rules = [
      {
        geometry-corner-radius = let
          radius = 20.0;
        in
        {
          bottom-left = radius;
          bottom-right = radius;
          top-left = radius;
          top-right = radius;
        };
        clip-to-geometry = true;
      }
      # Float
      {
        matches = [ 
          { 
            app-id = "guifetch|yad|zenity|wev|org\.gnome\.FileRoller|file-roller|blueman-manager|com\.github\.GradienceTeam\.Gradience"
              + "|feh|imv|system-config-printer|org.freedesktop.impl.portal.desktop.kde|xdg-desktop-portal-gtk|nz.co.mega.megasync|delta-patcher"
              + "|.*Windows.*|be.alexandervanhee.gradia|qalculate-gtk|org.quickshell|.*scrcpy.*";
          }
          {
            app-id = "com-abdownloadmanager-desktop-AppKt";
            title = "Add Download, float on";
          }
          {
            app-id = "lutris";
            title = "^Log for.*";
          }

          # Dialogs
          {
            title = "(Select|Open)( a)? (File|Folder)(s)?|(Operation|Upload)( Progress)?|.* Properties|Export Image as PNG"
            + "|GIMP Crash Debug|Save As|Library";
          }

          # Steam
          {
            app-id = "steam";
            title = "title Friends List";
          }
        ];
        open-floating = true;
      }
      {
        matches = [{ app-id = "limo"; }];
        excludes = [{ title = ".* - Limo$"; }];
        open-floating = true;
      }
      {
        matches = [{ app-id = "notificationtoasts_.*_desktop"; }];
        open-floating = true;
        open-focused = false;
        default-floating-position = {
          x = 0;
          y = 0;
          relative-to = "bottom-right";
        };
      }

      # Float and resize
      {
        matches = [{ app-id = "org\.gnome\.Settings"; }];
        open-floating = true;
        default-column-width = { proportion = 0.7; };
        default-window-height = { proportion = 0.8; };
      }
      {
        matches = [{ app-id = "org\.pulseaudio\.pavucontrol|yad-icon-browser"; }];
        open-floating = true;
        default-column-width = { proportion = 0.6; };
        default-window-height = { proportion = 0.7; };
      }
      {
        matches = [{ app-id = "^nwg.*"; }];
        open-floating = true;
        default-column-width = { proportion = 0.5; };
        default-window-height = { proportion = 0.6; };
      }
      {
        matches = [{ title = "terminal-(filechooser|filepicker)"; }];
        open-floating = true;
        default-column-width = { proportion = 0.65; };
        default-window-height = { proportion = 0.61; };
      }

      # Picture in picture
      {
        matches = [{ title = "Picture(-| )in(-| )[Pp]icture"; }];
        open-floating = true;
        default-floating-position = {
          x = 0.75;
          y = 0.75;
          relative-to = "bottom-right";
        };
      }
      {
        matches = [
          {
            app-id = "equibop";
            title = "^$";
          }
        ];
        open-floating = true;
        default-floating-position = {
          x = 0.75;
          y = 0.75;
          relative-to = "bottom-right";
        };
        default-column-width = { proportion = 0.3; };
        default-window-height = { proportion = 0.25; };
      }

      {
        matches = [{ app-id = "discord|equibop|vesktop|whatsapp|BeeperTexts"; }];
        open-on-workspace = "chat";
        open-focused = true;
        open-maximized = true;
      }
      {
        matches = [{ app-id = "shijima-qt"; }];
        open-on-workspace = "shijima";
        open-focused = true;
        open-maximized = true;
      }
    ];

    layer-rules = [
      {
        matches = [{ namespace = "^dms:(notification-.*)"; }];
        block-out-from = "screen-capture";
      }
    ];
  };
}
