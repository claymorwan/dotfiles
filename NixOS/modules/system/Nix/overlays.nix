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

      lutris-unwrapped = prev.lutris-unwrapped.overrideAttrs (finalAttrs: {
        version = "0.5.22-0-unstable-2026-04-20";

        src = pkgs.fetchFromGitHub {
          owner = "lutris";
          repo = "lutris";
          rev = "5aa61a238ef99108f524563ff451fa2c3095094d";
          hash = "sha256-0tOKh7vGKwpLTx8q07ITyOHuwJveKxLC2VIfNOWOITE=";
        };
      });

      # Local packages
      fluxer = pkgs.callPackage "${self}/pkgs/fluxer" { inherit (inputs) fluxer-src; };
      fluxer-canary = pkgs.callPackage "${self}/pkgs/fluxer-canary" { inherit (inputs) fluxer-canary-src; };
      shiru = pkgs.callPackage "${self}/pkgs/shiru" { };
      shijima-qt-bin = pkgs.callPackage "${self}/pkgs/shijima-qt-bin" { };
      wl_shimeji = pkgs.callPackage "${self}/pkgs/wl_shimeji" { };
      wallpaperengine-gui = pkgs.callPackage "${self}/pkgs/wallpaperengine-gui" { };
      git-fish = pkgs.callPackage "${self}/pkgs/git-fish" { };

      mouse-cursor = pkgs.callPackage "${self}/pkgs/cursors" { cursorName = config.globVars.mouseCursor.name; };
      neuwaita = pkgs.callPackage "${self}/pkgs/neuwaita" { };

      ## Fonts
      no-continue = pkgs.callPackage "${self}/pkgs/Fonts/no-continue.nix" { };

      ## Millennium
      millennium-material-theme = pkgs.callPackage "${self}/pkgs/Millennium/themes/millennium-material-theme" { inherit (inputs) millennium-material-theme-src; };
      extendium = pkgs.callPackage "${self}/pkgs/Millennium/plugins/extendium" { };
    })
  ];
}
