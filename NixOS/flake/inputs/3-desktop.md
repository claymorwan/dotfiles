```{.nix #flake-inputs}
# DMS related stuff

niri = {
  url = "github:sodiboo/niri-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};

noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
};

quickshell = {
  # add ?ref=<tag> to track a tag
  url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

  # THIS IS IMPORTANT
  # Mismatched system dependencies will lead to crashes and other issues.
  inputs.nixpkgs.follows = "nixpkgs";
};

dgop = {
  url = "github:AvengeMedia/dgop";
  inputs.nixpkgs.follows = "nixpkgs";
};

dms = {
  url = "github:AvengeMedia/DankMaterialShell";
  inputs.nixpkgs.follows = "nixpkgs";
  inputs.quickshell.follows = "quickshell";
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
