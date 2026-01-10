{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell # .default
    ./dsearch.nix
    ./plugins.nix
  ];

  # DMS
  programs.dank-material-shell = {
    enable = true;

    # quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
  };
}
