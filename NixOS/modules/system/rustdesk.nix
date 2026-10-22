{
  services.rustdesk-server = {
    enable = true;
    openFirewall = true;
     signal.relayHosts = [ "" ];
  };

  systemd.services.rustdesk-signal.environment.TEST_HBBS = "no";
}
