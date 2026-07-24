{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./flatpak.nix
  ];
  
  programs = {
    onlyoffice.enable = true;
    btop.enable = true;
  };

  home.packages = with pkgs; [
    # CLIs
    ookla-speedtest
    # speedtest-cli
    dragon-drop
    scrcpy
    yt-dlp
    sl
    zenity
    pipes
    cbonsai
    linux-wallpaperengine
    wev
    wl_shimeji
    wineWow64Packages.full
    xdelta
    inputs.lncur.packages.${pkgs.stdenv.hostPlatform.system}.default

    # GUI
    chromium
    # fluxer-canary
    # stoat-desktop
    packet
    localsend
    catppuccinifier-gui
    gnome-font-viewer
    gnome-disk-utility
    kooha
    # bottles
    obsidian
    qalculate-gtk
    proton-vpn
    intiface-central
    polychromatic
    qbittorrent
    fragments
    audacity
    winboat
    gradia
    shiru
    shijima-qt-bin
    shimelinux
    nicotine-plus
    gpu-screen-recorder-gtk
    handbrake
    inputs.kopuz.packages.${system}.default
    # (lib.mkIf config.programs.noctalia-shell.enable pkgs.wallpaperengine-gui)
    # waywallen
    # waywallen-layer-shell
    pwvucontrol

    # Kde stuff
    kdePackages.gwenview
    kdePackages.ksshaskpass
  ];
}
