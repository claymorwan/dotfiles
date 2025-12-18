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
      titanfall-2 = winGameOptions // {
        id = 1237970;
      };

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
      spelunky-2 = winGameOptions // {
        id = 418530;
      };

      # Peak
      peak = winGameOptions // {
        id = 3527290;
      };

      # Waterpark simulator
      waterpark-simulator = winGameOptions // {
        id = 3293260;
      };

      # Portal 2
      portal-2 = gameOptions // {
        id = 620;
      };

    };
  };
}
