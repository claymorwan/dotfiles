{ pkgs, ... }:

{
  imports = [
    ./helix.nix
    ./neovim.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    sqlitebrowser

    jetbrains.pycharm-professional

  ];
}
