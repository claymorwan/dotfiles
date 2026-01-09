{
  programs.niri.settings = {
    window-rules = [
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
          relative-to = "top-left";
        };
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
