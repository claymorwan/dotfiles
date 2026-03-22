{ inputs, lib, config, ... }:

{
  imports = [
    # inputs.omnisearch.nixosModules.default
  ];

  services = {
    mpris-proxy.enable = true;
    # omnisearch.enable = true;

    cliphist.enable = lib.mkIf config.programs.noctalia-shell.enable true;
  };
}
