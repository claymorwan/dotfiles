{ pkgs, ... }:

{
  imports = [
    ./krita
  ];

  home.packages = with pkgs; [
    blockbench
  ];
}
