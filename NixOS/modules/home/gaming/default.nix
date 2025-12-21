{ pkgs, ... }:

{
  imports = [
    ./lutris.nix
    ./mangohud.nix
    ./steam.nix
  ];

  home.packages = with pkgs; [
    gamemode
    prismlauncher
    protonplus
    limo
    gale
    # wine-discord-ipc-bridge

    # osu-lazer-bin
    # sm64coopdx
    (pkgs.callPackage ../../../packages/sm64coopdx/package.nix { })
  ];
}
