{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    inputs.nurpkgs.homeModules.shimelinux
    # inputs.nur.repos.claymorwan.homeModules.shimelinux
    ./flatpak.nix
  ];
  
  programs = {
    nix-init = {
      enable = true;
      settings = {
        maintainers = [ "claymorwan" ];
      };
    };

    shimelinux = {
      enable = true;
      autostart = true;
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
    yt-dlp
    sl
    zenity
    pipes
    cbonsai
    linux-wallpaperengine
    wev
    inputs.wl_shimeji.packages.${system}.default
    wineWow64Packages.full
    xdelta
    inputs.lncur.packages.${system}.default

    # GUI
    veracrypt
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
    # winboat
    gradia
    shiru
    shijima-qt-bin
    nicotine-plus
    gpu-screen-recorder-gtk
    handbrake
    # inputs.kopuz.packages.${system}.default
    kopuz
    # nur.repos.forkprince.fluxer-canary-bin
    pwvucontrol

    # Kde stuff
    kdePackages.gwenview
    kdePackages.ksshaskpass
  ];
}
