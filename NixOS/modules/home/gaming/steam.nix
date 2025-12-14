{ inputs, pkgs, ... }:

let
  launch_opt = "mangohud gamemoderun %command%";
  compat = "GE-Proton";
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
      "322170" = {
        compatTool = compat;
        launchOptions = "WINEDLLOVERRIDES=\"xinput1_4=n,b\" ${launch_opt}";
      };
      
      # Titanfall 2
      "1237970" = {
        compatTool = compat;
        launchOptions = launch_opt;
      };

      # Subnautica
      "264710" = {
        compatTool = compat;
        launchOptions = "WINEDLLOVERRIDES=\"winhttp=n,b\" ${launch_opt}";
      };

      # Subnautica: Below Zero
      "848450" = {
        compatTool = compat;
        launchOptions = "WINEDLLOVERRIDES=\"winhttp=n,b\" ${launch_opt}";
      };

      # Spelunky 2
      "418530" = {
        compatTool = compat;
        launchOptions = launch_opt;
      };

      # Peak
      "3527290" = {
        compatTool = compat;
        launchOptions = launch_opt;
      };

      # Waterpark simulator
      "3293260" = {
        compatTool = compat;
        launchOptions = launch_opt;
      };

      # Portal 2
      "620" = {
        launchOptions = launch_opt;
      };

    };
  };
}
