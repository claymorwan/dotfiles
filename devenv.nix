{ pkgs, ... }:

{
  # packages = [ pkgs.git pkgs.nixpkgs-fmt pkgs.update-nix-fetchgit ];

  languages.nix.enable = true;

  pre-commit.hooks = {
    nixfmt.enable = true;
  };
}
