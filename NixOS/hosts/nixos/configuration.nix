# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./../../modules/system
  ];

  boot.initrd.luks.devices."luks-2ee397b7-ed8a-4268-aaac-1294cad57c05".device = "/dev/disk/by-uuid/2ee397b7-ed8a-4268-aaac-1294cad57c05";

  boot = {
    blacklistedKernelModules = [
      "rtw88_8822bu"
      "rtw88_usb"
      "rtw88_core"
    ];

    extraModulePackages = with config.boot.kernelPackages; [
      rtl88x2bu
      # (config.boot.kernelPackages.callPackage ./../../pkgs/rtl88x2bu.nix {})
    ];

    extraModprobeConfig = ''
      options 88x2bu rtw_switch_usb_mode=1
    '';
  };
}
