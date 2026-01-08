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
    olympus
    # wine-discord-ipc-bridge

    # osu-lazer-bin
    sm64coopdx
  ];
}
