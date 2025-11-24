{ pkgs, system, inputs, ... }:

{
  home.packages = with pkgs; [
    ghostty
    yazi
    speedtest-cli

    equibop

    #adw-gtk3
    adwsteamgtk
    #papirus-icon-theme

    gnome-font-viewer
    gnome-disk-utility

    lutris
    gamemode
    mangohud
    prismlauncher

    linux-wallpaperengine
  ];
}
