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

dms-plugin-registry = {
  url = "github:AvengeMedia/dms-plugin-registry";
  inputs.nixpkgs.follows = "nixpkgs";
};

nix-monitor.url = "github:antonjah/nix-monitor";
```
