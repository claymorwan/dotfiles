{ inputs, lib, pkgs, osConfig, ... }:

{
  imports = [
    ./lutris.nix
    ./mangohud.nix
    ./omikuji.nix
    ./steam.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    protonplus
    limo
    gale
    olympus
    # sm64coopdx

    (osu-lazer-bin.override {
      nativeWayland = true;
    })
  ];

  xdg = {
    dataFile = {
      "sm64coopdx/mods/character-select-coop" = {
        source = pkgs.fetchzip {
          url = "https://github.com/Squishy6094/character-select-coop/releases/download/v1.16.3/character-select-coop.zip";
          hash = "sha256-zM6gy/+MolJcHn/SxfUyvchUtL4wn0xLolTvIZhUZ+8=";
        };
      };
    };
  };
}
