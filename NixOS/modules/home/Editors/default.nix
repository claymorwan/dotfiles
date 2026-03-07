{ pkgs, ... }:

{
  imports = [
    # ./helix.nix
    ./jetbrains.nix
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
  ];
}
