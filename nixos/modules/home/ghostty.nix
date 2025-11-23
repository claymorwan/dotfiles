{ pkgs, ... }:

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
  '';
}
