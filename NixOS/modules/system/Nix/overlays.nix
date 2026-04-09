{ inputs, pkgs, config, self,... }:

{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default

    (final: prev: {
      local-utils = pkgs.callPackage "${self}/pkgs/utils.nix" { };

      fluxer = pkgs.callPackage "${self}/pkgs/fluxer" { inherit (inputs) fluxer-src; };
      shiru = pkgs.callPackage "${self}/pkgs/shiru" { };
      shijima-qt-bin = pkgs.callPackage "${self}/pkgs/shijima-qt-bin" { };
      wallpaperengine-gui = pkgs.callPackage "${self}/pkgs/wallpaperengine-gui" { };

      mouse-cursor = pkgs.callPackage "${self}/pkgs/cursors" { cursorName = config.globVars.mouse_cursor; };
      neuwaita = pkgs.callPackage "${self}/pkgs/neuwaita" { };

      # Fonts
      no-continue = pkgs.callPackage "${self}/pkgs/Fonts/no-continue.nix" { };

      # Millennium
      millennium-material-theme = pkgs.callPackage "${self}/pkgs/Millennium/themes/millennium-material-theme" { inherit (inputs) millennium-material-theme-src; };
      extendium = pkgs.callPackage "${self}/pkgs/Millennium/plugins/extendium" { };
    })
  ];
}
