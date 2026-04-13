{ inputs, pkgs, config, self,... }:

let
  # Using `self` to point to a patch makes the package rebuild every time so gotta use this instead
  patchDir = ../../../pkgs/Patches;
in 
{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default

    (final: prev: {
      local-utils = pkgs.callPackage "${self}/pkgs/utils.nix" { };

      # Overrides
      omnisearch = inputs.omnisearch.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (finalAttrs: {
        patches = [ "${patchDir}/ctp-mocha-latte-mauve.patch" ];
      });
      gradia = prev.gradia.overrideAttrs (finalAttrs: {
        patches = [ "${patchDir}/0001-style-stdin-remove-extra-text-from-stdin.patch" ];
      });

      fluxer = pkgs.callPackage "${self}/pkgs/fluxer" { inherit (inputs) fluxer-src; };
      shiru = pkgs.callPackage "${self}/pkgs/shiru" { };
      shijima-qt-bin = pkgs.callPackage "${self}/pkgs/shijima-qt-bin" { };
      wallpaperengine-gui = pkgs.callPackage "${self}/pkgs/wallpaperengine-gui" { };

      mouse-cursor = pkgs.callPackage "${self}/pkgs/cursors" { cursorName = config.globVars.mouseCursor.name; };
      neuwaita = pkgs.callPackage "${self}/pkgs/neuwaita" { };

      # Fonts
      no-continue = pkgs.callPackage "${self}/pkgs/Fonts/no-continue.nix" { };

      # Millennium
      millennium-material-theme = pkgs.callPackage "${self}/pkgs/Millennium/themes/millennium-material-theme" { inherit (inputs) millennium-material-theme-src; };
      extendium = pkgs.callPackage "${self}/pkgs/Millennium/plugins/extendium" { };
    })
  ];
}
