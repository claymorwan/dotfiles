{
  description = "NixOS configuration";

  inputs = {
    # Nix stuffs
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # url = "/mnt/media/Programmation/Nix/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nurpkgs = {
      url = "github:claymorwan/nurpkgs";
      # url = "/mnt/media/Programmation/Nix/nurpkgs";
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
    
    nix-options-doc = {
      url = "github:Thunderbottom/nix-options-doc";
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

    # Apps
    catppuccin.url = "github:catppuccin/nix";
    
    steam-config-nix = {
      url = "github:different-name/steam-config-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    millennium = {
      url = "github:SteamClientHomebrew/Millennium/next?dir=packages/nix";
    # inputs.nixpkgs.follows = "nixpkgs";
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
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixcord-rollback = {
      url = "github:kaylorben/nixcord/0aef5bd949185a189adb79c886acee1abd64109a";
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
    
    omnisearch = {
      url = "github:indium114/omnisearch-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        # omnisearch-src.follows = "omnisearch-src";
        # beaker-src.follows = "beaker-src";
      };
    };
    
    nu-scripts = {
      url = "github:nushell/nu_scripts";
      flake = false;
    };
    
    kopuz = {
      url = "github:temidaradev/kopuz"; # ?tag=latest";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    
    omikuji = {
      url = "github:omikuji-launcher/omikuji";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    
    vertd = {
      url = "github:VERT-sh/vertd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    prefixer = {
      url = "github:wojtmic/prefixer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    wl_shimeji = {
      url = "git+https://github.com/claymorwan/wl_shimeji?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    pyroclear = {
      url = "github:shreyanth-sureshkrishnaa/pyroclear";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    proton-cachyos = {
      url = "github:Daaboulex/proton-cachyos-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dw-proton.url = "github:imaviso/dwproton-flake";
    
    fastpotify = {
      url = "github:crmne/fastpotify";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    amethyst = {
      url = "github:ChrisDKN/Amethyst-Mod-Manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    # Desktop stuffs (WM and shells)  
    niri = {
      url = "github:epireyn/niri-flake";
      # url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nsticky = {
     url = "github:lonerOrz/nsticky";
     inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # noctalia = {
    #   url = "github:noctalia-dev/noctalia-shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    
    # caelestia = {
    #   url = "github:caelestia-dots/shell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    
    # caffyne = {
    #   url = "github:caffyne-org/caffyne-shell";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };
    
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dank-greeter = {
      url = "github:AvengeMedia/dank-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dsearch = {
      url = "github:AvengeMedia/danksearch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dcal = {
      url = "github:AvengeMedia/dankcalendar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-monitor.url = "github:antonjah/nix-monitor";
    
    dms-common = {
      url = "github:hthienloc/dms-common";
      flake = false;
    };

    # Source codes inputs    
    millennium-material-theme-src = {
      url = "github:kuska1/Material-Theme";
      flake = false;
    };
    
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      nur,
      ...
    }:
    let
      username = "claymorwan";
      # system = "x86_64-linux";

      mkNixosConfig =
        host:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            inherit username;
            inherit host;
            inherit self;
            # inherit system;
          };

          modules = [
            ./hosts/${host}
            ./variables
            nur.modules.nixos.default
          ];
        };
    in
    {
      templates = import ./dev-shells;
      formatter.x86_64-linux = nixpkgs.legacyPackages."x86_64-linux".nixfmt-tree;
      nixosConfigurations = {
        nixos = mkNixosConfig "nixos";
        nixos-laptop = mkNixosConfig "nixos-laptop";
        android = mkNixosConfig "android";
      };
    };
}
# ~/~ end
