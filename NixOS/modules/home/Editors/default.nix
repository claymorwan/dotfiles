{ pkgs, ... }:

{
  imports = [
    # ./helix.nix
    ./jetbrains.nix
    #./neovim.nix
    ./zed.nix
  ];

  programs = {
    godot = {
      enable = true;
      package = pkgs.godot-mono;
      exportTemplates = with pkgs; [
        godotPackages.export-templates-mono-bin
      ];
    };

    jq.enable = true;
  };

  home.packages = with pkgs; [
    neovim
    sqlitebrowser
    distrobox
    boxbuddy
  ];
}
