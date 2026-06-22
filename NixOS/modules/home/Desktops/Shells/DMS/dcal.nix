{ inputs, ... }:

{
  imports = [
    inputs.dcal.homeModules.default
  ];

  programs.dank-calendar = {
    enable = true;
    systemd.enable = true;
  };
}
