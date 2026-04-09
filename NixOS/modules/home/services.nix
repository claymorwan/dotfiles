{ inputs, lib, config, ... }:

{
  services = {
    mpris-proxy.enable = true;
    easyeffects.enable = true;
    cliphist.enable = lib.mkIf config.programs.noctalia-shell.enable true;
  };
}
