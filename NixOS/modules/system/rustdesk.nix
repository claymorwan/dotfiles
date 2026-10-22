{
  services.rustdesk-server = {
    enable = true;
    openFirewall = true;
     signal.relayHosts = [ "remote-desktop.fembois.dev" ];
  };

  systemd.services.rustdesk-signal.environment.TEST_HBBS = "no";
}
