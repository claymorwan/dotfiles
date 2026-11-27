{ osConfig, ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "lua"
    ];

    mutableUserSettings = false;
    userSettings = {
      auto_install_extensions = {
        catppuccin-icons = true;

      };

      buffer_font_family = osConfig.globVars.font_family;

      icon_theme = "Catppuccin Mocha";

      theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Frappe";
      };
    };
  };
}
