{ pkgs, ... }:

{
  imports = [
    ./neovim.nix
    ./zed.nix
  ];

  home.packages = with pkgs; [
    jetbrains.pycharm-professional

  ];
}
