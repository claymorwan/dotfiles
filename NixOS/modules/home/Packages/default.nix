{ inputs, pkgs, config, ... }:

{
  imports = [
    ./flatpak.nix
  ];

  programs = {

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    onlyoffice.enable = true;
    btop.enable = true;
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
    wev

    # GUI
    equibop
    (pkgs.callPackage ../../../pkgs/fluxer/default.nix { })
    stoat-desktop
    (pkgs.gradia.overrideAttrs (finalAttrs: {
      patches = [ ./gradia.patch ];
    }))
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
    (pkgs.callPackage ../../../pkgs/shijima-qt-bin { })
    (pkgs.callPackage ../../../pkgs/namida-bin { })
    (lib.mkIf config.programs.noctalia-shell.enable (pkgs.callPackage ../../../pkgs/wallpaperengine-gui { }))

    # Kde stuff
    kdePackages.gwenview
    kdePackages.plasma-browser-integration
    kdePackages.ksshaskpass
  ];
}
