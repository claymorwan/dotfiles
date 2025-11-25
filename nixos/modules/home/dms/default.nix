{ inputs, pkgs, ... }:

let
  inherit
    (import ./../../variables/variables.nix)
    submodules_dir
    ;
in
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

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
  
    plugins = {

      # Wallpaper engine
      dms-wallpaperengine = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "sgtaziz";
          repo = "dms-wallpaperengine";
          rev = "57720f431c714d4f2999da54b4b01646f126873e";
          hash = "sha256-kra4ArLHUJfCy3bOUQAvvDX3xb6h62pyYFLcHuUjhsM=";
        };
      };

      # Web search
      dms-web-search = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "devnullvoid";
          repo = "dms-web-search";
          rev = "81ccd9fd8249b3c9ef40dde42549f807e36ae3e3";
          hash = "sha256-mKbmROijhYhy/IPbVxYbKyggXesqVGnS/AfAEyeQVhg=";
        };
      };

      # Calculator
      DankCalculator = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "rochacbruno";
          repo = "DankCalculator";
          rev = "de6dbd59b7630e897a50e107f704c1cd4a131128";
          hash = "sha256-Vq+E2F2Ym5JdzjpCusRMDXd6uuAhhjAehyD/tO3omdY=";
        };
      };

      # Emoji launcher
      dms-emoji-launcher = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "rochacbruno";
          repo = "DankCalculator";
          rev = "de6dbd59b7630e897a50e107f704c1cd4a131128";
          hash = "sha256-Vq+E2F2Ym5JdzjpCusRMDXd6uuAhhjAehyD/tO3omdY=";
        };
      };

      # docker manager
      docker-manager = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "LuckShiba";
          repo = "DmsDockerManager";
          rev = "860457bbb043a6651a2cbafe6e77d443123a0b07";
          hash = "sha256-VoJCaygWnKpv0s0pqTOmzZnPM922qPDMHk4EPcgVnaU=";
        };
      };
    
    };
  };
}
