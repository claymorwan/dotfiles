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
    #initrd.luks.devices."luks-d350cbe5-5f3e-4b16-96d2-3b4ecc608855".device = "/dev/disk/by-uuid/d350cbe5-5f3e-4b16-96d2-3b4ecc608855";

    plymouth.enable = true;
    # kernelParams = [ "quiet" ];
  };
}
