{ pkgs, ... }:

{
  imports = [
    ./lutris.nix
    ./mangohud.nix
    ./steam.nix
  ];

  home.packages = with pkgs; [
    prismlauncher
    protonplus
    limo
    gale
    olympus
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.proton-ge-bin
      ];
    })
    faugus-launcher
    # wine-discord-ipc-bridge

    # osu-lazer-bin
    #sm64coopdx
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
