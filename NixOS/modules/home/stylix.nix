{ inputs, pkgs, config, osConfig, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
  ];
  
  home.pointerCursor.enable = true;

  stylix = {
    enable = true;
    autoEnable = false;

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    override = {
      base00 = "181825";
      base01 = "1e1e2e";
      base0D = "cba6f7";
      base0E = "89b4fa";
    };
        
    icons = {
      enable = true;
      dark = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override { inherit (config.catppuccin) accent flavor; };
    };

    fonts = {
      serif = {
        name = "JetBrainsMono NFP";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      sansSerif = config.stylix.fonts.serif;

      monospace = {
        name = "JetBrainsMono NFM";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };

      sizes.applications = 10;
    };

    cursor = {
      name = osConfig.globVars.mouseCursor.name;
      size = osConfig.globVars.mouseCursor.size;
      package = pkgs.mouse-cursor;
    };

    targets = {
      # kde.enable = true;
      qt.enable = true;
      xresources.enable = true;
      blender.enable = true;
      nixcord.enable = true;

      gtk = {
        enable = true;
        flatpakSupport.enable = true;
      };

      zen-browser = {
        enable = true;
        profileNames = [ "default" ];
      };
    };
  };
}
