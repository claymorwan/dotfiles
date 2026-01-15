```{.nix #flake-inputs}
nixpkgs.url = "nixpkgs/nixos-unstable";
# home-manager, used for managing user configuration
home-manager = {
  url = "github:nix-community/home-manager";
  inputs.nixpkgs.follows = "nixpkgs";
};

nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

nix-output-monitor = {
  url = "github:maralorn/nix-output-monitor";
  inputs.nixpkgs.follows = "nixpkgs";
};

archix = {
  url = "github:SamLukeYes/archix";
  inputs.nixpkgs.follows = "nixpkgs";
};
```
