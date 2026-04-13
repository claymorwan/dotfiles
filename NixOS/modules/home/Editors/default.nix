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

    godot-mono
  ];

  home.file = {
    ".local" = {
      source = pkgs.godotPackages.export-templates-mono-bin;
      recursive = true;
    };
  };
}
