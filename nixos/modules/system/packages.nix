{ pkgs, inputs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    kdeconnect.enable = true;
    droidcam.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  # Allow unfree pkg
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    #neovim
    bat
    fastfetch
    blahaj
    tuckr
    eza
    fd
    ffmpeg-full
    uwsm
    v4l-utils
    wget
    wl-clipboard
    app2unit
    rar

    nurl
    update-nix-fetchgit

    unzip

    gnumake
    gcc
    python3
    uv
    lua

    wineWowPackages.staging
    
    vlc
  ];

}
