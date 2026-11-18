{ inputs, pkgs, ... }:

{
  imports = [
    inputs.dcal.homeModules.default
  ];

  programs.dank-calendar = {
    enable = true;
    # package = pkgs.dux-calendar;
    systemd.enable = true;
  };
}
