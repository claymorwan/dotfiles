{ pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    sqlitebrowser

    jetbrains.pycharm-professional

  ];
}
