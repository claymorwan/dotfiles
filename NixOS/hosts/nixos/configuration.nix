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

  boot.initrd.luks.devices."luks-f39cc2fd-88f1-4b75-994c-49f9175d4506".device = "/dev/disk/by-uuid/f39cc2fd-88f1-4b75-994c-49f9175d4506";
  
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
