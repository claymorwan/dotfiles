```{.nix #flake-inputs}
# DMS related stuff

niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
dgop = {
  url = "github:AvengeMedia/dgop";
  inputs.nixpkgs.follows = "nixpkgs";
};

dms = {
  url = "github:AvengeMedia/DankMaterialShell";
  inputs = {
    nixpkgs.follows = "nixpkgs";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";
  };
};

dsearch = {
  url = "github:AvengeMedia/danksearch";
  inputs.nixpkgs.follows = "nixpkgs";
};

nix-monitor.url = "github:antonjah/nix-monitor";

dms-plugins-official = {
  url = "github:AvengeMedia/dms-plugins";
  flake = false;
};

dms-lucyfire-plugins = {
  url = "github:lucyfire/dms-plugins";
  flake = false;
};

dms-wallpaper-engine = {
  url = "github:sgtaziz/dms-wallpaperengine";
  flake = false;
};

dms-app-shortcut = {
  url = "github:oabragh/AppShortcut";
  flake = false;
};

dms-media-player = {
  url = "github:arrifat346afs/mediaPlayer";
  flake = false;
};

dms-desktop-cmd = {
  url = "github:yayuuu/desktopCommand";
  flake = false;
};
```
