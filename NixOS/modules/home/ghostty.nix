{ pkgs, osConfig, ... }:

{
  programs.ghostty = {
    enable = true;

    settings = {
      # theme = "Catppuccin Mocha";
      clipboard-read = "allow";
      cursor-style = "bar";
      font-family = osConfig.globVars.font_family; # "JetBrainsMono NF";
      gtk-titlebar = true;
      gtk-tabs-location = "bottom";
      window-decoration = "client";
      custom-shader = [
        "${osConfig.globVars.submodules_dir}/ghostty/shaders/0xhckr/gears-and-belts.glsl"
        "${osConfig.globVars.submodules_dir}/ghostty/shaders/cursors/public/shaders/cursor_smear.glsl"
      ];
    };
  };
}
