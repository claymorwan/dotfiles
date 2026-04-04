{ inputs, pkgs, config, ... }:

{
  nixpkgs.overlays = [
    inputs.millennium.overlays.default

    (final: prev: {
      local-utils = pkgs.callPackage ../../../pkgs/utils.nix { };

      fluxer = pkgs.callPackage ../../../pkgs/fluxer { inherit (inputs) fluxer-src; };
      shiru = pkgs.callPackage ../../../pkgs/shiru { };
      shijima-qt-bin = pkgs.callPackage ../../../pkgs/shijima-qt-bin { };
      wallpaperengine-gui = pkgs.callPackage ../../../pkgs/wallpaperengine-gui { };

      mouse-cursor = pkgs.callPackage ../../../pkgs/cursors { cursorName = config.globVars.mouse_cursor; };
      neuwaita = pkgs.callPackage ../../../pkgs/neuwaita { };

      # Fonts
      no-continue = pkgs.callPackage ../../../pkgs/Fonts/no-continue.nix { };

      # Millennium
      millennium-material-theme = pkgs.callPackage ../../../pkgs/Millennium/themes/millennium-material-theme { inherit (inputs) millennium-material-theme-src; };
      extendium = pkgs.callPackage ../../../pkgs/Millennium/plugins/extendium { };
    })
  ];
}
