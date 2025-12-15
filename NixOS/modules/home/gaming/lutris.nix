{ pkgs, config, ... }:

{
  programs.lutris = {
    enable = true;

    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = [ pkgs.proton-ge-bin ]; # config.programs.steam.extraCompatPackages;
  };
}
