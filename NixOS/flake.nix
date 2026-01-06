{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    nix-output-monitor = {
      url = "github:maralorn/nix-output-monitor";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdp-termfilepickers = {
      url = "github:Guekka/xdg-desktop-portal-termfilepickers";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    steam-config-nix = {
      url = "github:different-name/steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:Trivaris/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };

    # DMS related stuff
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
      inputs = {
        nixpkgs.follows = "nixpkgs";
        # dgop.follows = "dgop";
        quickshell.follows = "quickshell";
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
  };

  outputs =
    inputs@{
      nixpkgs,
      catppuccin,
      home-manager,
      nix-flatpak,
      ...
    }:
    let
      username = "claymorwan";
      system = "x86_64-linux";

      mkNixosConfig =
        host:
        nixpkgs.lib.nixosSystem {
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
      templates = import ./dev-shells;
      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
      nixosConfigurations = {
        nixos = mkNixosConfig "nixos";
        nixos-laptop = mkNixosConfig "nixos-laptop";
      };
    };
}
