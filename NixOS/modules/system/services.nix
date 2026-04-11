{ inputs, pkgs, self, ... }:

{
  imports = [
    inputs.omnisearch.nixosModules.default
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
    };

    libinput = {
      enable = true;
    };

    power-profiles-daemon = {
      enable = true;
    };
    
    omnisearch = {
      enable = true;
      package =  pkgs.omnisearch;
    };

    printing.enable = true;
    joycond.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    upower.enable = true;
    fwupd.enable = true;
    gnome.gnome-keyring.enable = true;
    input-remapper.enable = true;
  };
}
