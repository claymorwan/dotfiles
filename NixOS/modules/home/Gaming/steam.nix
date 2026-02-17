{
  inputs,
  pkgs,
  lib,
  ...
}:

let
  gameOptions.launchOptions.wrappers = [
    (lib.getExe' pkgs.mangohud "mangohud")
    pkgs.gamemode
  ];

  winGameOptions = gameOptions // {
    compatTool = "GE-Proton";
  };

in
{
  imports = [
    inputs.steam-config-nix.homeModules.default
  ];

  programs.steam.config = {
    enable = true;
    closeSteam = true; # See 'Important' note at beginning of this readme

    apps = {

      # Geometry dash
      geometry-dash = lib.recursiveUpdate winGameOptions {
        id = 322170;
        launchOptions = {
          env.WINEDLLOVERRIDES = "xinput1_4=n,b";
        };
      };

      # Titanfall 2
      "1237970" = winGameOptions;

      # Subnautica
      subnautica = lib.recursiveUpdate winGameOptions {
        id = 264710;
        launchOptions = {
          env.WINEDLLOVERRIDES = "winhttp=n,b";
        };
      };

      # Subnautica: Below Zero
      subnautica-bz = lib.recursiveUpdate winGameOptions {
        id = 848450;
        launchOptions = {
          env.WINEDLLOVERRIDES = "winhttp=n,b";
        };
      };

      # Spelunky 2
      " 418530" = winGameOptions;

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

      "1962890" = lib.recursiveUpdate gameOptions {
        launchOptions.env."PROTON_ENABLE_WAYLAND" = 1;
      };

      "1226640" = winGameOptions;

      # Overcooked 2
      "728880" = winGameOptions;

      # Slime Rancher
      "433340" = winGameOptions;

      # The Beginner's Guide
      "303210" = winGameOptions;

      # Wasteland bites demo
      "3820720" = gameOptions;

      "1229490" = lib.recursiveUpdate winGameOptions {
        launchOptions.env."PROTON_ENABLE_WAYLAND" = 1;
      };
      # ultrakill = {
      #   id = 1229490;
      #   compatTool = "GE-Proton";
      #   launchOptions.wrappers = [
      #     pkgs.gamemode
      #     (lib.getExe' pkgs.gamescope "gamescope") 
      #     "-f" "-w" "1920" "-h" "1080" "-W" "1920" "-H" "1080" "--force-grab-cursor" "--mangoapp" "--"
      #   ];
      # };

      # Pizza tower
      "2231450" = winGameOptions;

      # Ena DBBQ
      "2134320" = gameOptions;
    };
  };
}
