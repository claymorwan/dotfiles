{ pkgs, ... }:

{
  services.clamav = {
    package = pkgs.clamav;

    updater = {
      enable = true;
    };

    daemon = {
      enable = true;
    };

    scanner = {
      enable = true;
    };
  };
}
