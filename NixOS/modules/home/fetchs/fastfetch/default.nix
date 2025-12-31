let
  inherit (import ../../../../variables/variables.nix)
    flake_dir
    ;
in
{
  imports = [
    # ./layout_1.nix
    ./layout_2.nix
  ];

  programs.fastfetch = {
    enable = true;

  };
}
