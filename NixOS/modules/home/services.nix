{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:

{
  services = {
    gpg-agent = {
      enable = true;
      pinentry = lib.mkIf config.programs.dank-material-shell.plugins.dankPinentry.enable {
        package = inputs.dms-plugin-dankPinentry.packages.${pkgs.stdenv.hostPlatform.system}.pinentry-dms;
        program = "pinentry-dms";
      };
    };

    mpris-proxy.enable = true;
    # easyeffects.enable = true;
    cliphist.enable = config.programs.noctalia-shell.enable;
  };
}
