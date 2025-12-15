{ inputs, username, system, ... }:

let
  inherit
    (import ../../variables/variables.nix)
    home_dir
    dotfiles_dir
    ;
in
{
  imports = [
    # inputs.dankMaterialShell.nixosModules.dankMaterialShell
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  programs.dankMaterialShell = {
  #   enable = true;
  #
  #   quickshell.package = inputs.quickshell.packages.${system}.default;
  #   
  #   systemd = {
  #     enable = true;             # Systemd service for auto-start
  #     restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
  #   };
  #
  #   # Core features
  #   enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  #   # enableClipboard = true;            # Clipboard history manager
  #   enableVPN = true;                  # VPN management widget
  #   # enableBrightnessControl = true;    # Backlight/brightness controls
  #   # enableColorPicker = true;          # Color picker tool
  #   enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  #   enableAudioWavelength = true;      # Audio visualizer (cava)
  #   enableCalendarEvents = true;       # Calendar integration (khal)
  #   # enableSystemSound = true;          # System sound effects

    greeter = {
      enable = true;
      compositor.name = "hyprland";  # Or "hyprland" or "sway"

      configHome = "${home_dir}";
      configFiles = [
        "${dotfiles_dir}/Configs/dms/.config/DankMaterialShell/settings.json"
      ];
    };
  };
}
