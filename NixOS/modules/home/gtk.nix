{ pkgs, ... }:

let
  inherit (import ./../../variables/variables.nix)
    submodules_dir
    ;
in
{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      #package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  xdg.configFile."gtk-3.0/gtk.css".text = ''
    @import url("${submodules_dir}/catppuccin/monorepo/adw/themes/mocha/catppuccin-mocha-mauve.css");
  '';
  xdg.configFile."gtk-4.0/gtk.css".text = ''
    @import url("${submodules_dir}/catppuccin/monorepo/adw/themes/mocha/catppuccin-mocha-mauve.css");
  '';
}
