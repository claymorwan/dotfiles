{ pkgs, inputs, ... }:

{
  programs = {
    steam = {
      enable = true;
      # package = let
      #   pkgs = import inputs.nixpkgs {
      #     system = "x86_64-linux";
      #     overlays = [ inputs.millennium.overlays.default ];
      #     config.allowUnfree = true; # Add this if you are overriding inputs.nixpkgs for the millennium input
      #   };
      # in
      # pkgs.millennium-steam;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

    gamescope = {
      enable = true;

      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };

  hardware.steam-hardware.enable = true;
}
