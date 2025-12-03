{ pkgs, username, inputs, system, ... }:

let
  inherit
    (import ./../../variables/variables.nix)
    flake_dir
    ;
in
{
  programs.nh = {
    enable = true;
    package = pkgs.nh.overrideAttrs (_: {
      runtimeDeps = [
        inputs.nix-output-monitor.packages.${system}.default 
      ];
    });
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${flake_dir}"; # sets NH_OS_FLAKE variable for you
  };

  environment.systemPackages = with pkgs; [
    # nix-output-monitor
  ];
}
