{ inputs, config, pkgs, ... }:

{
  imports = [
    ../../modules/system
  ];

  boot.initrd.luks.devices."luks-bee2fb52-34f3-4982-9e1c-42768023be40".device = "/dev/disk/by-uuid/bee2fb52-34f3-4982-9e1c-42768023be40";
}
