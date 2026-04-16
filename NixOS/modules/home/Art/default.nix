{ pkgs, ... }:

{
  imports = [
    ./krita
  ];

  home.packages = with pkgs; [
    blockbench
    blender
    kdePackages.kdenlive
    # davinci-resolve
    # openshot-qt
  ];
}
