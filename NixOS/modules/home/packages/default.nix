{
  pkgs,
  system,
  inputs,
  ...
}:

{
  imports = [
    ./flatpak.nix
  ];

  programs = {
    firefox.enable = true;
    btop.enable = true;
    # quickshell.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    onlyoffice.enable = true;
  };

  home.packages = with pkgs; [
    # CLIs
    ookla-speedtest
    # speedtest-cli
    dragon-drop
    scrcpy
    yt-dlp-light
    lolcat
    kittysay
    sl
    zenity

    equibop
    gradia
    #adw-gtk3
    adwsteamgtk
    #papirus-icon-theme
    (pkgs.callPackage ../../../packages/shiru/package.nix { })

    gnome-font-viewer
    gnome-disk-utility

    kooha

    bottles

    obsidian

    linux-wallpaperengine

    # Kde stuff
    kdePackages.gwenview
    kdePackages.kdenlive
    kdePackages.plasma-browser-integration

    intiface-central
  ];
}
