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
  };

  home.file."./.config/ghostty/config".text = ''

    theme = Catppuccin Mocha
    clipboard-read = allow
    cursor-style = bar
    font-family = JetBrainsMono NF
    gtk-titlebar = true
    window-decoration = client
    gtk-tabs-location = bottom
    # Shaders
    custom-shader = ~/.dotfiles/Submodules/ghostty/hackr-sh/gears-and-belts.glsl
    # Cursor
    custom-shader = ~/.dotfiles/Submodules/ghostty/shader-playground/public/shaders/cursor_smear.glsl
  '';
}
