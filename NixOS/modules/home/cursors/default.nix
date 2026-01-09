{ pkgs, ... }:

let
  inherit (import ./../../../variables/variables.nix)
    mouse_cursor
    ;
in
{

  home.pointerCursor = {
    enable = true;

    name = "${mouse_cursor}";
    package = (pkgs.callPackage ./cursor.nix { });

    hyprcursor = {
      enable = true;
      size = 24;
    };
    gtk.enable = true;
    x11.enable = true;
  };
}
