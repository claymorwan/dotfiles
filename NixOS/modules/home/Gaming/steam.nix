{ inputs, pkgs, lib, ... }:

let
  defaultWrappers = [
    pkgs.gamemode
    (lib.getExe' pkgs.mangohud "mangohud")
  ];

  gameOptions.launchOptions.wrappers = defaultWrappers; # ++ [ (lib.getExe' pkgs.mangohud "mangohud") ];

  winGameOptions = lib.recursiveUpdate gameOptions {
    compatTool = "GE-Proton";
    launchOptions = {
      wrappers = defaultWrappers ++ [
        (lib.getExe' inputs.scopebuddy.packages.${pkgs.stdenv.hostPlatform.system}.default "scopebuddy")
        # "-w" "2560" "-h" "1440"
        "-O" "DP-1"
        "-f"
        "--mangoapp"
        "--expose-wayland"
        "--"
      ];

      env = {
        # PROTON_ENABLE_WAYLAND = 1;
        SCB_AUTO_RES = 1;
      };
    };
  };
in
{
  imports = [
    inputs.steam-config-nix.homeModules.default
  ];

  home.packages = [
    inputs.scopebuddy.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Millenium theme
  xdg = {
    dataFile."Steam/steamui/skins/Material-Theme".source = pkgs.millenium-material-theme;
    
    configFile."scopebuddy/scb.conf".text = ''
      SCB_GAMESCOPE_ARGS="-f --mangoapp"
      SCB_AUTO_RES=1
    '';
  };

  programs.steam.config = {
    enable = true;
    closeSteam = true; # See 'Important' note at beginning of this readme
      
    apps = {
      # Geometry dash
      "322170" = lib.recursiveUpdate winGameOptions {
        launchOptions.env.WINEDLLOVERRIDES = "xinput1_4=n,b";
      };

      # Titanfall 2
      "1237970" = lib.recursiveUpdate gameOptions {
        launchOptions = {
          env = {
            PROTON_ENABLE_WAYLAND = 0;
            PROTON_LOG = 1;
            OPENSSL_ia32cap = "~0x20000000";
          };

          args = [
            "-novid"
          ];
        };
      };

      # Subnautica
      "264710" = lib.recursiveUpdate winGameOptions {
        launchOptions.env.WINEDLLOVERRIDES = "winhttp=n,b";
      };

      # Subnautica: Below Zero
      "848450" = lib.recursiveUpdate winGameOptions {
        launchOptions.env.WINEDLLOVERRIDES = "winhttp=n,b";
      };

      # Spelunky 2
      "418530" = winGameOptions;

      # Peak
      "3527290" = winGameOptions;

      # Waterpark simulator
      "3293260" = winGameOptions;

      # Portal 2
      "620" = winGameOptions;

      # Portal Revolution
      "601360" = winGameOptions;

      # R.E.P.0
      "3241660" = winGameOptions;

      "1962890" = gameOptions;

      "1226640" = winGameOptions;

      # Overcooked 2
      "728880" = winGameOptions;

      # Slime Rancher
      "433340" = winGameOptions;

      # The Beginner's Guide
      "303210" = winGameOptions;

      # Wasteland bites demo
      "3820720" = gameOptions;

      # Ultrakill
      "1229490" = winGameOptions;

      # Pizza tower
      "2231450" = winGameOptions;

      # Ena DBBQ
      "2134320" = gameOptions;

      # Denshattack Demo
      "4142750" = winGameOptions;

      # Boost vector EX Demo
      "4338440" = gameOptions;

      # Awaria
      "3274300"= winGameOptions;

      # White Knhcle Demo
      "3218540" = winGameOptions;

      # Herringen Demo
      "4283210" = winGameOptions;

      # Quaver
      "980610" = gameOptions;

      # Data Center Demo
      "4376050" = winGameOptions;

      # Nothing Together
      "2788630" = winGameOptions;

      # Content Warning
      "2881650" = winGameOptions;

      # Subterranauts
      "3075800" = winGameOptions;
    };
  };
}
