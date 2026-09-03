{ inputs, pkgs, ... }:

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
      godotPackages_4_5.export-templates-bin
    ];
  };

  home.packages = with pkgs; [
    sqlitebrowser
    distrobox
    boxbuddy
    unityhub
    gitte
    inputs.nurpkgs.packages.${pkgs.stdenv.hostPlatform.system}.utmt-cli
  ];
}
