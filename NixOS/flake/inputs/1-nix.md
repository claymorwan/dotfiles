```{.nix #flake-inputs}
nixpkgs.url = "nixpkgs/nixos-unstable";
# home-manager, used for managing user configuration

# home-manager = {
#   url = "/mnt/media/Programmation/Nix/home-manager";
#   inputs.nixpkgs.follows = "nixpkgs";
# };

# home-manager = {
#   url = "github:claymorwan/home-manager/nushell-fixes";
#   inputs.nixpkgs.follows = "nixpkgs";
# };

home-manager = {
  url = "github:nix-community/home-manager";
  inputs.nixpkgs.follows = "nixpkgs";
};

nur = {
  url = "github:nix-community/NUR";
  inputs.nixpkgs.follows = "nixpkgs";
};

nurpkgs = {
  url = "github:claymorwan/nurpkgs";
  inputs.nixpkgs.follows = "nixpkgs";
};

nixos-avf = {
  url = "github:nix-community/nixos-avf";
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

stylix = {
  url = "github:nix-community/stylix";
  inputs.nixpkgs.follows = "nixpkgs";
};
```
