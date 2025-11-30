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
        "~/.dotfiles/Submodules/ghostty/hackr-sh/gears-and-belts.glsl"
        "~/.dotfiles/Submodules/ghostty/shader-playground/public/shaders/cursor_smear.glsl"
      ];
    };
  };
}
