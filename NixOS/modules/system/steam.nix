{ pkgs, inputs, ... }:

{
  programs = {
    steam = {
      enable = true;
      package = pkgs.millennium-steam;

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

  programs.gamemode = {
    enable = true;
  };

  hardware.steam-hardware.enable = true;
}
