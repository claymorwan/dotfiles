{ pkgs, ... }:

{
  imports = [
    ./jetbrains.nix
    ./zed.nix
  ];

  programs.godot = {
    enable = true;
    package = pkgs.godot-mono;
    exportTemplates = with pkgs; [
      godotPackages.export-templates-mono-bin
    ];
  };

  home.packages = with pkgs; [
    sqlitebrowser
    distrobox
    boxbuddy
    unityhub
    utmt-cli
    gitte
  ];
}
