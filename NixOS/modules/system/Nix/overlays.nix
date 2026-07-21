{ inputs, pkgs, config, self,... }:

let
  # Using `self` to point to a patch makes the package rebuild every time so gotta use this instead
  patchDir = ../../../pkgs/Patches;

  mkLocalPkg = path: pkgs.callPackage "${self}/pkgs/${path}" { };
in 
{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default
    # inputs.waywallen.overlays.default

    (final: prev: {
      local-utils = pkgs.callPackage "${self}/pkgs/utils.nix" { };

      # Overrides
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

      proton-ge-bin = prev.proton-ge-bin.overrideAttrs (finalAttrs: {
        version = "GE-Proton10-34";

        src = pkgs.fetchzip {
          url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${finalAttrs.version}/${finalAttrs.version}.tar.gz";
          hash = "sha256-lzPsYYcrp5NoT3B0WFj3o10Z7tXx7xva1wEP3edeuqM=";
        };
      });

      yazi = prev.yazi.override {_7zz = pkgs._7zz-rar; };

      # Local packages
      fluxer = (mkLocalPkg "fluxer").override { inherit (inputs) fluxer-src; };
      fluxer-canary = mkLocalPkg "fluxer-canary";
      # shiru = mkLocalPkg "shiru";
      shijima-qt-bin = mkLocalPkg "shijima-qt-bin";
      wl_shimeji = mkLocalPkg "wl_shimeji";
      wallpaperengine-gui = mkLocalPkg "wallpaperengine-gui";
      git-fish = mkLocalPkg "git-fish";
      # omikuji-bin = mkLocalPkg "omikuji-bin";
      utmt-cli = mkLocalPkg "utmt-cli";
      shimelinux = mkLocalPkg "shimelinux";

      mouse-cursor = (mkLocalPkg "cursors").override { cursorName = config.globVars.mouseCursor.name; };
      neuwaita = mkLocalPkg "neuwaita";
      catppuccin-kde = mkLocalPkg "catppuccin-kde";

      ## Fonts
      no-continue = mkLocalPkg "Fonts/no-continue.nix";

      ## Millennium
      millennium-material-theme = pkgs.callPackage "${self}/pkgs/Millennium/themes/millennium-material-theme" { inherit (inputs) millennium-material-theme-src; };
      extendium = mkLocalPkg "Millennium/plugins/extendium";
    })
  ];
}
