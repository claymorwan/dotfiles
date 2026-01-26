let
  inherit (import ../../../../variables)
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
