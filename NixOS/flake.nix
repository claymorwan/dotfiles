{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nix-output-monitor.url = "github:maralorn/nix-output-monitor";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    xdp-termfilepickers.url = "github:Guekka/xdg-desktop-portal-termfilepickers/copilot/fix-file-picker-issue";

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

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };

    dsearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = inputs@{ nixpkgs, catppuccin, home-manager, nix-flatpak, ... }:
    let
      username = "claymorwan";
      system = "x86_64-linux";
      
      mkNixosConfig = host: nixpkgs.lib.nixosSystem {
        specialArgs = {
	        inherit inputs;
	        inherit username;
	        inherit host;
	        inherit system;
	      };

	      modules = [
	        nix-flatpak.nixosModules.nix-flatpak
	        ./hosts/${host}
	        catppuccin.nixosModules.catppuccin
	      ];
      };
    in
    {
      nixosConfigurations = {
        nixos = mkNixosConfig "nixos";
	      nixos-laptop = mkNixosConfig "nixos-laptop";
      };
    };
}
