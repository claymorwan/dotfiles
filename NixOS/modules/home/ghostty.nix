{ pkgs, ... }:

let
  inherit
    (import ../../variables/variables.nix)
    submodules_dir
    font_family
    ;
in
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    settings = {
      # theme = "Catppuccin Mocha";
      clipboard-read = "allow";
      cursor-style = "bar";
      font-family = font_family; #"JetBrainsMono NF";
      gtk-titlebar = true;
      gtk-tabs-location = "bottom";
      window-decoration = "client";
      custom-shader = [
        "${submodules_dir}/ghostty/shaders/0xhckr/gears-and-belts.glsl"
        "${submodules_dir}/ghostty/shaders/cursors/public/shaders/cursor_smear.glsl"
      ];
    };
  };
}
