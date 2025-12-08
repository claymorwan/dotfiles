{ pkgs, config, ... }:

{
  # Use the GRUB 2 boot loader.
  boot = {
    loader = {
      timeout = 10;

      efi = {
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true; # Otherwise /boot/EFI/BOOT/BOOTX64.EFI isn't generated
        devices = ["nodev"];
        useOSProber = true;
        extraEntriesBeforeNixOS = false;
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }
          menuentry "Poweroff" {
            halt
          }
        '';
	      configurationLimit = 10;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';

    plymouth.enable = true;
    # kernelParams = [ "quiet" ];
  };
}
