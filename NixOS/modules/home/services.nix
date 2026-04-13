{ config, ... }:

{
  services = {
    mpris-proxy.enable = true;
    easyeffects.enable = true;
    cliphist.enable = config.programs.noctalia-shell.enable;
  };
}
