{ pkgs, ... }:

{
  imports = [
    # ./jetbrains.nix
    ./zed.nix
  ];

  programs.godot = {
    enable = true;
    package = pkgs.godot-mono;
    exportTemplates = with pkgs; [
      godotPackages.export-templates-mono-bin
      godotPackages_4_5.export-templates-bin
    ];
  };

  home.packages = with pkgs; [
    sqlitebrowser
    distrobox
    boxbuddy
    unityhub
    gitte
    nur.repos.claymorwan.utmt-cli
  ];
}
