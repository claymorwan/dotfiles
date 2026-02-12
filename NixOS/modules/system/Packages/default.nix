{ pkgs, inputs, ... }:

let
  inherit (import ../../../variables)
  enableNiri
  enableHyprland
  ;
in
{
  imports = [
    # inputs.niri.nixosModules.niri
    ./flatpak.nix
  ];

  nixpkgs.config.allowBroken = true;

  programs = {
    hyprland = {
      enable = enableHyprland;
      package = pkgs.hyprland;
      withUWSM = false;
    };

    hyprlock.enable = enableHyprland;

    niri = {
      enable = enableNiri;
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

    kdeconnect = {
      enable = true;
      package = pkgs.valent;
    };

    gpu-screen-recorder.enable = true;
    droidcam.enable = true;
  };

  # Allow unfree pkg
  nixpkgs.config.allowUnfree = true;

  systemd.user.services.niri-flake-polkit.enable = false;

  environment.systemPackages = with pkgs; [
    kitty
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
    amdgpu_top
    # inputs.entangled.packages.${pkgs.stdenv.hostPlatform.system}.default
    usbutils
    wlr-randr

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
