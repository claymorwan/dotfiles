```{.nix #flake-inputs}
catppuccin = {
  url = "github:catppuccin/nix";
  inputs.nixpkgs.follows = "nixpkgs";
};

steam-config-nix = {
  url = "github:different-name/steam-config-nix";
  # inputs.nixpkgs.follows = "nixpkgs";
};

millennium = {
  url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  inputs.nixpkgs.follows = "nixpkgs";
};

scopebuddy = {
  url = "github:HikariKnight/ScopeBuddy";
  inputs.nixpkgs.follows = "nixpkgs";
};

spicetify-nix = {
  url = "github:Gerg-L/spicetify-nix";
  inputs.nixpkgs.follows = "nixpkgs";
};

xdp-termfilepickers = {
  url = "github:Guekka/xdg-desktop-portal-termfilepickers";
  inputs.nixpkgs.follows = "nixpkgs";
};

zen-browser = {
  url = "github:0xc000022070/zen-browser-flake";
  inputs = {
    home-manager.follows = "home-manager";
    nixpkgs.follows = "nixpkgs";
  };
};

nixcord = {
  url = "github:kaylorben/nixcord";
  inputs.nixpkgs.follows = "nixpkgs";
};

gsr = {
  url = "github:Elibrio/gsr-nix";
  inputs.nixpkgs.follows = "nixpkgs";
};

devenvcp = {
  url = "git+https://codeberg.org/claymorwan/devenvcp";
  inputs.nixpkgs.follows = "nixpkgs";
};

lncur = {
  url = "git+https://codeberg.org/claymorwan/lncur";
  inputs.nixpkgs.follows = "nixpkgs";
};

namida = {
  url = "git+https://codeberg.org/iWisp360/namida-nix";
  # inputs.nixpkgs.follows = "nixpkgs";
};

omnisearch = {
  url = "git+https://git.bwaaa.monster/omnisearch";
  inputs.nixpkgs.follows = "nixpkgs";
};

nixvim = {
  url = "github:nix-community/nixvim";
  inputs.nixpkgs.follows = "nixpkgs";
};
```
