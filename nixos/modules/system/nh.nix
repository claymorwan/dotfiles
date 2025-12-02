{ pkgs, username, ... }:

let
  inherit
    (import ./../../variables/variables.nix)
    flake_dir
    ;
in
{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${flake_dir}"; # sets NH_OS_FLAKE variable for you
  };

  environment.systemPackages = with pkgs; [
    # inputs.nix-output-monitor.packages.${pkgs.system}.default
    nix-output-monitor
  ];
}
