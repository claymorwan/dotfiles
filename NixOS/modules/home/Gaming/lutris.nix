{ pkgs, osConfig, ... }:

{
  programs.lutris = {
    enable = true;

    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = osConfig.programs.steam.extraCompatPackages;
  };
}
