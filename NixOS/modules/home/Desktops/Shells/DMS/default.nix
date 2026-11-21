{ inputs, pkgs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell # .default
    ./dcal.nix
    ./plugins.nix
  ];

  # DMS
  programs.dank-material-shell = {
    enable = true;
    # package = inputs.dms.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (_: {
    #   vendorHash = "sha256-DinkXtyVURJ5I00B+j/otCcjm2MD9B0vessdqwd8zoU=";
    # });
    
    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = false; # Calendar integration (khal)
  };
}
