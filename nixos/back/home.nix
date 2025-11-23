{ config, pkgs, system, inputs, ... }:

{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  home.username = "claymorwan";
  home.homeDirectory = "/home/claymorwan";

  home.packages = with pkgs; [
    ghostty
    yazi
    speedtest-cli

    adw-gtk3
    adwsteamgtk
    papirus-icon-theme

    steam
    lutris
    protonplus

    inputs.zen-browser.packages."${system}".default
  ];

  programs.git.settings = {
    enable = true;
    userName = "claymorwan";
    userEmail = "claymorwan@fembois.dev";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
   };

  # DMS
  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dankMaterialShell changes
    };
  
    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableClipboard = true;            # Clipboard history manager
    enableVPN = true;                  # VPN management widget
    enableBrightnessControl = true;    # Backlight/brightness controls
    enableColorPicker = true;          # Color picker tool
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableSystemSound = true;          # System sound effects
  };

  home.stateVersion = "25.05";
}
