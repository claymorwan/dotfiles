{ pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.nixosModules.niri
    ./flatpak.nix
  ];

  nixpkgs.config.allowBroken = true;

  programs = {
    hyprland = {
      # enable = true;
      # withUWSM = true;
    };
    hyprlock.enable = true;

    niri = {
      enable = true;
      package = pkgs.niri;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    gpu-screen-recorder.enable = true;
    kdeconnect.enable = true;
    droidcam.enable = true;
  };

  # Allow unfree pkg
  nixpkgs.config.allowUnfree = true;

  systemd.user.services.niri-flake-polkit.enable = false;

  environment.systemPackages = with pkgs; [
    kitty
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
    unzip
    efibootmgr
    imagemagick

    gpu-screen-recorder
    gpu-screen-recorder-gtk

    gnumake
    gcc
    python3
    uv
    lua
    luajitPackages.luarocks
    go
    dotnetCorePackages.sdk_9_0_1xx-bin
    nimble

    wineWowPackages.staging

    vlc
  ];

}
