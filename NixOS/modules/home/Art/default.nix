{ pkgs, ... }:

{
  imports = [
    ./krita
  ];

  home.packages = with pkgs; [
    blockbench
    kdePackages.kdenlive
    # davinci-resolve
    # openshot-qt
  ];
}
