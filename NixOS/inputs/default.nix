{
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

  catppuccin = {
    url = "github:catppuccin/nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  spicetify-nix = {
    url = "github:Gerg-L/spicetify-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  xdp-termfilepickers = {
    url = "github:Guekka/xdg-desktop-portal-termfilepickers"; # /copilot/fix-file-picker-issue";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  steam-config-nix = {
    url = "github:different-name/steam-config-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs = {
      home-manager.follows = "home-manager";
      nixpkgs.follows = "nixpkgs";
    };
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
    inputs.dgop.follows = "dgop";
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
}
