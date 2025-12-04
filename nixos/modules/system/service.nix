{ ... }:

{
  
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
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  security.rtkit.enable = true;
}
