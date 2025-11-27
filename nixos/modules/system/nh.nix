{ pkgs, username, ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${username}/.dotfiles/nixos"; # sets NH_OS_FLAKE variable for you
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
  ];
}
