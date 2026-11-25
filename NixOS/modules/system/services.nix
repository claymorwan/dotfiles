{ inputs, config, ... }:

{
  imports = [
    inputs.omnisearch.nixosModules.default
    inputs.vertd.nixosModules.default
  ];

  services = {
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;
    };

    # cloudflared = {
    #   enable = true;
    #   tunnels = {
    #     };
    #   };
    # };

    qbittorrent = {
      enable = true;
      extraArgs = [ "--confirm-legal-notice" ];
      serverConfig = {
        LegalNotice.Accepted = true;
        Preferences = {
          WebUI = {
            Username = "claymorwan";
            Password_PBKDF2 = "pb8aUAYrlHmB/sI2+qoabw==:LLwmTeuMOzvomc/PuVbSRWzEOVhlYIw0spAHy+LkHsgSQv3Vpd4wOkNff3NVq81WR8KwaYyf5blsHfeYlUkTOQ==";
          };

          General.Locale = "en";
        };
      };
    };
    
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    omnisearch.enable = true;
    # desktopManager.plasma6.enable = true;
    # vertd.enable = true;
    printing.enable = true;
    joycond.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    upower.enable = true;
    fwupd.enable = true;
    gnome.gnome-keyring.enable = true;
    # input-remapper.enable = true;
  };
}
