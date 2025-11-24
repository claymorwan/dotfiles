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
    ffmpeg
    uwsm
    v4l-utils
    wget
    wl-clipboard
    app2unit
    gnumake
    gcc
  ];

}
