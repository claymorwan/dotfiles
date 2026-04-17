{ pkgs, osConfig, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark"; # "Neuwaita";
      # package = (pkgs.callPackage ../../pkgs/neuwaita/package.nix { });
    };
    gtk3 = {
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };

      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };

      extraCss = ''
        @import url("${osConfig.globVars.submodules_dir}/catppuccin/monorepo/adw/themes/mocha/catppuccin-mocha-mauve.css");
      '';
    };

    gtk4 = {
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3; # pkgs.gnome-themes-extra;
      };

      extraCss = ''
        @import url("${osConfig.globVars.submodules_dir}/catppuccin/monorepo/adw/themes/mocha/catppuccin-mocha-mauve.css");
      '';
    };
  };
}
