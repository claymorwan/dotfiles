{ pkgs, osConfig, ... }:

{
  programs.lutris = {
    enable = true;

    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = osConfig.programs.steam.extraCompatPackages;

    runners.wine.settings.system.env.PROTON_ENABLE_WAYLAND = 1;
  };
}
