{ pkgs, system, inputs, ... }:

{

  programs = {
    firefox.enable = true;
  };
  home.packages = with pkgs; [
    speedtest-cli
    dragon-drop
    scrcpy
    yt-dlp-light

    equibop
    gradia
    #adw-gtk3
    adwsteamgtk
    #papirus-icon-theme

    gnome-font-viewer
    gnome-disk-utility

    kooha

    obsidian
    krita

    linux-wallpaperengine

    kdePackages.gwenview
    kdePackages.kdenlive
    kdePackages.plasma-browser-integration
  ];
}
