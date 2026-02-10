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
    # firefox.enable = true;
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
    pipes
    (pkgs.callPackage ../../../pkgs/lncur/package.nix { })
    cbonsai
    linux-wallpaperengine

    # GUI
    equibop
    gradia
    (pkgs.callPackage ../../../pkgs/shiru/package.nix { })
    packet
    localsend
    catppuccinifier-gui
    gnome-font-viewer
    gnome-disk-utility
    kooha
    bottles
    obsidian
    qalculate-gtk
    protonvpn-gui
    intiface-central
    polychromatic

    # Kde stuff
    kdePackages.gwenview
    kdePackages.plasma-browser-integration
  ];
}
