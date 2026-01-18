{
  pkgs,
  username,
  inputs,
  ...
}:

let
  inherit (import ../../../variables/variables.nix)
    flake_dir
    ;
in
{
  programs.nh = {
    enable = true;
    package = pkgs.nh.override {
      nix-output-monitor = inputs.nix-output-monitor.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${flake_dir}";
  };
}
