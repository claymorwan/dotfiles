{ pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./neovim.nix
    ./zed.nix
  ];

  programs = {
    jq.enable = true;
  };

  home.packages = with pkgs; [
    sqlitebrowser
    distrobox
    boxbuddy

    jetbrains.idea
    # jetbrains.pycharm
  ];
}
