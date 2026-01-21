{ pkgs, host, ... }:

{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;

    nftables = {
      enable = true;
    };
  };
  services.firewalld = {
    enable = true;
    package = pkgs.firewalld;

    services = {
      
      kdeconnect = {
        short = "KDE Connect";
        ports = [
          {
            port = {
              from = 1714;
              to = 1764;
            };
            protocol = "tcp";
          }
          {
            port = {
              from = 1714;
              to = 1764;
            };
            protocol = "udp";
          }
        ];
      };

      localsend = {
        short = "LocalSend";
        ports = [
          {
            port = 53317;
            protocol = "tcp";
          }
          {
            port = 53317;
            protocol = "udp";
          }
        ];
      };

      packet = {
        short = "Packet";
        ports = [
          {
            port = 9300;
            protocol = "tcp";
          }
        ];
      };
    };
    zones = {
      public = {
        services = [
          "kdeconnect"
          "localsend"
          "http"
          "https"
        ];
      };
    };
  };
}
