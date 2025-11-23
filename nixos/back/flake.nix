{
  description = "Woag NixOS flake";

  inputs = {
    # NixOS unstable pkg source
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    catppuccin.url = "github:catppuccin/nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, catppuccin, home-manager, nix-flatpak, zen-browser, ... }@inputs: {
    let
      system = "x86_64-linux";
      username = "claymorwan";
      mkNixosConfig = host: nixpkgs.lib.nixosSystem {
        inherit system;
	specialArgs = {
	  inherit inputs;
	  #inherit host = ${host};
	  inherti username;
	  inherit profile;

	};
	modules = [
	  ./hosts/${host}/configuration.nix
	  nix-flatpak.nixosModules.nix-flatpak
	];
      };
    in
    {
      nixosConfigurations = {
        nixos = mkNixosConfig "nixos";
      };
    };
  };
}
