{ pkgs, system, inputs, ... }:

{

  programs = {
    firefox.enable = true;
    btop.enable = true;
    # quickshell.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
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

    jetbrains.pycharm-professional

    kdePackages.gwenview
    kdePackages.kdenlive
    kdePackages.plasma-browser-integration

    intiface-central

    # (pkgs.callPackage ../../packages/shiru.nix {})
    # (pkgs.callPackage ../../packages/shijima-qt.nix {})
  ];
}
