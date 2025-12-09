{ pkgs, ... }:

let
  inherit
    (import ./../../variables/variables.nix)
    submodules_dir
    ;
in
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    settings = {
      theme = "Catppuccin Mocha";
      clipboard-read = "allow";
      cursor-style = "bar";
      font-family = "JetBrainsMono NF";
      gtk-titlebar = true;
      gtk-tabs-location = "bottom";
      window-decoration = "client";
      custom-shader = [
        "~/.dotfiles/Submodules/ghostty/shaders/0xhckr/gears-and-belts.glsl"
        "~/.dotfiles/Submodules/ghostty/shaders/cursors/public/shaders/cursor_smear_rainbow.glsl"
      ];
    };
  };
}
