{ pkgs, ... }:

{

  # home.pointerCursor = {
  #   enable = true;
  #
  #   name = "WhiteSur Cursors";
  #   package = pkgs.whitesur-cursors;
  #
  #   hyprcursor = { 
  #     enable = true;
  #     size = 24;
  #   };
  #   gtk.enable = true;
  #   x11.enable = true;
  # };
  home.file.".icons" = {
    source = ./.icons;
    recursive = true;
  };
}
